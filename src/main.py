import connection as conn
import interface as inter

def main():
    # Cria uma instância da classe Connection
    db = conn.Connection()

    # Conecta no banco de dados
    db.connect()

    # Execução da interface

    # i.printHello()
    # i.printHeader()
    # i.selectOption(i.getOption(), sis)

    # Encerra a conexão com o banco de dados
    db.closeConn()

if __name__ == "__main__":
    main()
