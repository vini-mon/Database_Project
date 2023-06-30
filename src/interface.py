import time
from validations import *
from datetime import datetime

LINE_SIZE = 50

def initialSetup():
    print('*' * LINE_SIZE)
    print('Escolha uma das opções a seguir:')

    print('1 - Listar todos os usuários')
    print('2 - Listar todos as comunidades')
    print('3 - Listar todos as empresas')
    print('4 - Listar todos os dispositivos')
    print('5 - Listar todos os planos pessoais e seus benefícios')
    print('6 - Listar todos os planos comunitarios e seus benefícios')

    print('7 - Cadastrar um novo usuário')
    print('8 - Selecionar nome e data_nasc dos usuarios, com um dispositivo de um tipo específico, em todas as comunidades de um estado específico')

    print('0 - Sair do sistema')

def getOption():
    return int(input('Digite a opção desejada: '))

def loop(db):
    time.sleep(1)
    initialSetup()
    selectOption(getOption(), db)

def selectOption(option, db):
    if option == 0:
        print('Encerrando o sistema...')
        time.sleep(1)
        return
    elif option == 1:
        showUsuarios(db)
    elif option == 2:
        showComunidades(db)
    elif option == 3:
        showEmpresas(db)
    elif option == 4:
        showDispositivos(db)
    elif option == 5:
        showPlanosPessoais(db)
    elif option == 6:
        showPlanosComunitarios(db)
    elif option == 7:
        insertUsuario(db)
    elif option == 8:
        showUserDispositivoEstado(db)
    else:
        print('Opção inválida!')

    loop(db)

def showUsuarios(db):
    sql = '''
    select * from usuario order by nome asc;
    '''
    db.executeSQL(sql)
    db.showTable()

def showComunidades(db):
    sql = '''
    select * from comunidade order by nome asc;
    '''
    db.executeSQL(sql)
    db.showTable()

def showEmpresas(db):
    sql = '''
    select * from empresa order by nome asc;
    '''
    db.executeSQL(sql)
    db.showTable()

def showDispositivos(db):
    sql = '''
    select * from dispositivo order by nro_serie asc;
    '''
    db.executeSQL(sql)
    db.showTable()

def showPlanosPessoais(db):
    sql = '''
    select * from pessoal p
    join beneficio_pessoal bp on p.nome = bp.plano
    order by nome asc;
    '''
    db.executeSQL(sql)
    db.showTable()

def showPlanosComunitarios(db):
    sql = '''
    select * from comunitario c
    join beneficio_comunitario bc on c.nome = bc.plano
    order by nome asc;
    '''
    db.executeSQL(sql)
    db.showTable()

def insertUsuario(db):
    planosExistentes = getPlanosPessoais(db)

    cpf = input('Digite o CPF do usuário (xxx.xxx.xxx-xx): ')
    validate(cpf, validateCPF, notnull=True)

    nome = input('Digite o nome do usuário (a-zA-Z): ')
    validate(nome, validateCharacterString, maxSize=60)

    data_nasc = input('Digite a data de nascimento do usuário (d-m-y): ')
    validate(data_nasc, validateDate)
    while datetime.strptime(data_nasc, "%d-%m-%Y") >= datetime.today():
        print('Data de nascimento inválida!')
        data_nasc = input('Digite a data de nascimento do usuário: ')
        validate(data_nasc, validateDate(data_nasc))

    pais = input('Digite o país do usuário: ')
    validate(pais, validateCharacterString, maxSize=30)

    estado = input('Digite o estado do usuário: ')
    validate(estado, validateCharacterString, maxSize=30)

    cidade = input('Digite a cidade do usuário: ')
    validate(cidade, validateCharacterString, maxSize=30)

    cep = input('Digite o CEP do usuário: ')
    validate(cep, validateCEP, maxSize=15)

    rua = input('Digite a rua do usuário: ')
    validate(rua, validateString, maxSize=60)

    numero = input('Digite o número da casa do usuário: ')
    while not numero.isnumeric() or int(numero) <= 0 or int(numero) > 32767:
        print('Número inválido!')
        numero = input('Digite o número da casa do usuário: ')

    numero = int(numero)

    print(f'Planos existentes: {planosExistentes}')
    plano = input('Digite o plano do usuário: ')
    while plano not in planosExistentes or len(plano) > 30:
        print('Plano inválido!')
        plano = input('Digite o plano do usuário: ')

    data_adesao = input('Digite a data de adesão do usuário: ')
    validate(data_adesao, validateDate)

    data_venc = input('Digite a data de vencimento do usuário: ')
    validate(data_venc, validateDate)
    while datetime.strptime(data_venc, "%d-%m-%Y") < datetime.strptime(data_adesao, "%d-%m-%Y") or datetime.strptime(data_venc, "%d-%m-%Y") < datetime.today():
        print('Data de vencimento inválida!')
        data_venc = input('Digite a data de vencimento do usuário: ')
        validate(data_venc, validateDate)

    sql = '''
    insert into usuario (
        cpf, nome, data_nasc, pais, estado,
        cidade, cep, rua, numero, plano,
        data_adesao, data_venc
    )
    values (
        %s, %s, TO_DATE(%s, 'DD-MM-YYYY'), %s, %s,
        %s, %s, %s, %s, %s,
        TO_DATE(%s, 'DD-MM-YYYY'), TO_DATE(%s, 'DD-MM-YYYY')
    )
    '''

    valores = (
        cpf, nome, data_nasc, pais, estado,
        cidade, cep, rua, numero, plano,
        data_adesao, data_venc
    )

    db.executeSQLValores(sql, valores)
    db.commit()
    print('Usuário cadastrado com sucesso!')

def getPlanosPessoais(db):
    sql = '''
    select nome from pessoal c;
    '''
    db.executeSQL(sql)
    result = db.getTable()

    planos = []
    for row in result:
        planos.append(row[0])

    return planos


# Selecionar nome e data_nasc dos usuarios, com dispositivo de tipo TIPO, em	
# todas as comunidades de ESTADO.
def showUserDispositivoEstado(db):
    tipo = input('Digite o tipo do dispositivo: ')
    validate(tipo, validateString, maxSize=30)

    estado = input('Digite o estado: ')
    validate(estado, validateString, maxSize=30)

    
    sql = '''
    SELECT u.nome, u.data_nasc FROM usuario u,  	
	(SELECT ud.usuario FROM usuario_dispositivo ud
		JOIN dispositivo d ON ud.dispositivo = d.nro_serie AND UPPER(d.tipo) = %s
 	INTERSECT
 	SELECT uc.usuario FROM usuario_comunidade uc
		JOIN comunidade c ON uc.comunidade = c.registro AND UPPER(c.estado) = %s) 
	AS usuario_consulta
	WHERE u.cpf = usuario_consulta.usuario;
    '''

    valores = (tipo, estado)

    db.executeSQLValores(sql, valores)
    db.showTable()

