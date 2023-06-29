# Regra padrão para executar o programa
run:
	python3 main.py

# Regra para instalar as dependências do projeto (se necessário)
install:
	pip3 install -r psycopg2

# Regra para limpar arquivos gerados pelo programa (se necessário)
clean:
	rm -rf *.pyc