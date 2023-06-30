import time

LINE_SIZE = 50

def initialSetup():
    print('*' * LINE_SIZE)
    print('Escolha uma das opções a seguir:')
    print('1 - Listar todas comunidades que receberam todos os dispositivos de uma única empresa')

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
        showOption1(db)
    else:
        print('Opção inválida!')

    loop(db)

def showOption1(db):
    sql = '''
    SELECT c.nome, e.nome, COUNT(d.nro_serie) AS qtd_dispositivos
	FROM comunidade c
	JOIN dispositivo_comunidade_empresa dce ON c.registro = dce.comunidade
	JOIN empresa e ON dce.empresa = e.cnpj
	JOIN dispositivo d ON dce.dispositivo = d.nro_serie
	WHERE NOT EXISTS(
		SELECT * from dispositivo_comunidade_empresa dce2
		WHERE dce.comunidade = dce2.comunidade
    	AND dce.empresa <> dce2.empresa
	)
	GROUP BY c.nome, e.nome
	HAVING COUNT(DISTINCT dce.empresa) = 1;
    '''
    db.execute(sql)
    db.showTable()