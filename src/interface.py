import time
from validations import *
from datetime import datetime

LINE_SIZE = 50

# Interface do sistema
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

# Retorna a opção escolhida pelo usuário
def getOption():
    return int(input('Digite a opção desejada: '))

# Loop do sistema
def loop(db):
    time.sleep(1)
    initialSetup()
    selectOption(getOption(), db)

# Seleção de opções da interface
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

# Lista os usuários existentes no banco
def showUsuarios(db):
    sql = '''
    select * from usuario order by nome asc;
    '''
    db.executeSQL(sql)
    db.showTable()

# Lista as comunidades existentes no banco
def showComunidades(db):
    sql = '''
    select * from comunidade order by nome asc;
    '''
    db.executeSQL(sql)
    db.showTable()

# Lista as empresas existentes no banco
def showEmpresas(db):
    sql = '''
    select * from empresa order by nome asc;
    '''
    db.executeSQL(sql)
    db.showTable()

# Lista os dispositivos existentes no banco
def showDispositivos(db):
    sql = '''
    select * from dispositivo order by nro_serie asc;
    '''
    db.executeSQL(sql)
    db.showTable()

# Lista os planos pessoais existentes e seus benefícios,
# ordenados pelo nome do plano
def showPlanosPessoais(db):
    sql = '''
    select * from pessoal p
    join beneficio_pessoal bp on p.nome = bp.plano
    order by nome asc;
    '''
    db.executeSQL(sql)
    db.showTable()

# Lista os planos comunitários existentes e seus benefícios,
# ordenados pelo nome do plano
def showPlanosComunitarios(db):
    sql = '''
    select * from comunitario c
    join beneficio_comunitario bc on c.nome = bc.plano
    order by nome asc;
    '''
    db.executeSQL(sql)
    db.showTable()

# Realiza a inserção de um novo usuário no banco
def insertUsuario(db):
    planosExistentes = getPlanosPessoais(db) # Armazena os planos existentes
    usuariosExistentes = getUsuarios(db) # Armazena os usuários existentes

    # Lê e valida o cpf, verificando se já existe
    cpf = input('Digite o CPF do usuário (xxx.xxx.xxx-xx): ')
    validate(cpf, validateCPF, notnull=True)
    while cpf in usuariosExistentes:
        print('CPF já cadastrado!')
        cpf = input('Digite o CPF do usuário: ')
        validate(cpf, validateCPF, notnull=True)

    # Lê e valida o nome
    nome = input('Digite o nome do usuário (a-zA-Z): ')
    validate(nome, validateCharacterString, maxSize=60)

    # Lê e valida a data de nascimento
    data_nasc = input('Digite a data de nascimento do usuário (d-m-y): ')
    validate(data_nasc, validateDate)
    while datetime.strptime(data_nasc, "%d-%m-%Y") >= datetime.today(): # Verifica se a data de nascimento é válida
        print('Data de nascimento inválida!')
        data_nasc = input('Digite a data de nascimento do usuário: ')
        validate(data_nasc, validateDate(data_nasc))

    # Lê e valida o país
    pais = input('Digite o país do usuário: ')
    validate(pais, validateCharacterString, maxSize=30)

    # Lê e valida o estado
    estado = input('Digite o estado do usuário: ')
    validate(estado, validateCharacterString, maxSize=30)

    # Lê e valida a cidade
    cidade = input('Digite a cidade do usuário: ')
    validate(cidade, validateCharacterString, maxSize=30)

    # Lê e valida o CEP
    cep = input('Digite o CEP do usuário: ')
    validate(cep, validateCEP, maxSize=15)

    # Lê e valida a rua
    rua = input('Digite a rua do usuário: ')
    validate(rua, validateString, maxSize=60)

    # Lê e valida o número da casa
    numero = input('Digite o número da casa do usuário: ')
    while not numero.isnumeric() or int(numero) <= 0 or int(numero) > 32767:
        print('Número inválido!')
        numero = input('Digite o número da casa do usuário: ')

    numero = int(numero)

    # Lê e valida o plano do usuário
    print(f'Planos existentes: {planosExistentes}') # Mostra os planos existentes
    plano = input('Digite o plano do usuário: ')
    while plano not in planosExistentes or len(plano) > 30:
        print('Plano inválido!')
        plano = input('Digite o plano do usuário: ')

    # Lê e valida a data de adesão
    data_adesao = input('Digite a data de adesão do usuário: ')
    validate(data_adesao, validateDate)

    # Lê e valida a data de vencimento
    data_venc = input('Digite a data de vencimento do usuário: ')
    validate(data_venc, validateDate)
    # Verifica se a data de vencimento é válida
    while datetime.strptime(data_venc, "%d-%m-%Y") < datetime.strptime(data_adesao, "%d-%m-%Y") or datetime.strptime(data_venc, "%d-%m-%Y") < datetime.today():
        print('Data de vencimento inválida!')
        data_venc = input('Digite a data de vencimento do usuário: ')
        validate(data_venc, validateDate)

    # Máscara da query para inserção do usuário
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

    # Valores a serem inseridos
    valores = (
        cpf, nome, data_nasc, pais, estado,
        cidade, cep, rua, numero, plano,
        data_adesao, data_venc
    )

    db.executeSQLValores(sql, valores) # Executa a query
    db.commit() # Realiza o commit da inserção
    print('Usuário cadastrado com sucesso!')

def getUsuarios(db):
    sql = '''
    select cpf from usuario;
    '''
    db.executeSQL(sql)
    result = db.getTable()

    usuarios = []
    for row in result:
        usuarios.append(row[0])

    return usuarios

# Obtém o nome dos planos pessoais existentes
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
    # Lê e valida o tipo do dispositivo
    tipo = input('Digite o tipo do dispositivo: ')
    validate(tipo, validateString, maxSize=30)

    # Lê e valida o estado
    estado = input('Digite o estado: ')
    validate(estado, validateString, maxSize=30)

    # Máscara da query
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

    # Valores a serem inseridos
    valores = (tipo.upper(), estado.upper())

    db.executeSQLValores(sql, valores) # Executa a query
    db.showTable() # Mostra a tabela

