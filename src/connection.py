import psycopg2
from prettytable import PrettyTable

class Connection:
    def __init__(self) -> None:
        self.conn = None
        self.cursor = None
    
    # Inicia a conexão com o banco de dados
    def connect(self):
        # Dados de conexão
        (host, dbname, user, password) = ('localhost', 'postgres', 'postgres', 'admin')

        # String de conexão
        conn_string = f"host='{host}' dbname='{dbname}' user='{user}' password='{password}'"

        # Conecta no banco de dados
        self.conn = psycopg2.connect(conn_string)

        # Cria um cursor para executar as queries
        self.cursor = self.conn.cursor()

    def closeConn(self):
        self.cursor.close()
        self.conn.close()
    
    # Executa a query sql
    def executeSQL(self, sql):
        self.cursor.execute(sql)

    # Executa a query sql, permitindo o uso de máscara de valores
    def executeSQLValores(self, sql, valores):
        self.cursor.execute(sql, valores)

    # Finaliza uma transação
    def commit(self):
        self.conn.commit()

    def getTable(self):
        return self.cursor.fetchall()

    def showTable(self):
        # Obtem os resultados
        result = self.cursor.fetchall()

        # Cria a tabela
        table = PrettyTable()

        # Adiciona as colunas à tabela
        table.field_names = [desc[0] for desc in self.cursor.description]

        # Adiciona as linhas à tabela
        for row in result:
            table.add_row(row)

        # Exibe a tabela
        print(table)

    