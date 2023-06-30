import re

def validate(string, func, maxSize=-1, notnull=False):
    checkSize = maxSize != -1

    if checkSize:
        while len(string) > maxSize:
            print(f'Entrada {string} inválida! O tamanho deve ser no máximo {maxSize} caracteres.')
            string = input(f'Digite {string} novamente: ')

    if notnull:
        while not func(string):
            print(f'Entrada {string} inválida!')
            string = input(f'Digite {string} novamente: ')
    else:
        while not func(string) and string != '':
            print(f'Entrada {string} inválida!')
            string = input(f'Digite {string} novamente: ')

    return string

def matchRegex(regex, string):
    if re.match(regex, string):
        return True
    return False

def validateCPF(cpf):
    return matchRegex('^[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}$', cpf)

def validateCharacterString(string, spaces=True):
    if spaces:
        return matchRegex('^[a-zA-Z\s]+$', string)
    return matchRegex('^[a-zA-Z]+$', string)

def validateString(string, spaces=True):
    if spaces:
        return matchRegex('^[a-zA-Z0-9\s]+$', string)
    return matchRegex('^[a-zA-Z0-9]+$', string)

def validateDate(date):
    return matchRegex('^[0-9]{2}-[0-9]{2}-[0-9]{4}$', date)

def validateCEP(cep):
    return matchRegex('^[0-9\-]+$', cep)

def validatePlano(plano, planos):
    if plano in planos:
        return True
    return False