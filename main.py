#     Jão     - 
#     Gabriel -
#     Samuka  -
#     Vinícius Santos Monteiro  - 11932463

'''

    EXPLICANDO ESSA BAGAÇEIRA

    HÁ 4 BRIDGES E 8 RELAYS

    OS BRIDGES ESTÃO NAS CAPITAIS E OS RELAYS ESTÃO LOCALIZADO ACIMA DE ÁREAS INDIGENAS

'''

# Inserts bridges data into the database

'''
    * altitude varia de 550 a 1200 km
    * largura de banda varia de 50 a 150 Mbps

    ACRE -9.9829, -67.82067
    AMAZONAS -3.0850, -60.0368
    RORAIMA 2.8398, -60.6487
    TOCANTINS -10.2229, -48.3294
'''


# Select all satalites in the database

command = "SELECT * FROM Satellites"

insert_bridge = [

    "INSERT INTO bridge (nro_serie, fabricante, lat, long, alt, lanrgura_banda) values (001, 'SpaceX', -9.9829, -67.8206, 650, 70)",
    "INSERT INTO bridge (nro_serie, fabricante, lat, long, alt, lanrgura_banda) values (002, 'SpaceX', -3.0850, -60.0368, 650, 70)",
    "INSERT INTO bridge (nro_serie, fabricante, lat, long, alt, lanrgura_banda) values (003, 'SpaceX', 2.8398, -60.6487, 650, 70)",
    "INSERT INTO bridge (nro_serie, fabricante, lat, long, alt, lanrgura_banda) values (004, 'SpaceX', -10.2229, -48.3294, 650, 70)"

]

# Inserts Relay data into the database

'''

    * altitude varia de 550 a 1200 km
    * largura de banda varia de 50 a 150 Mbps

ACRE
    -8.3262, -72.1138
    -10.0282, -69.3149


# AMAZONAS
    -5.3889, -71.0087
    -6.1522, -61.4996
    -7.6725, -64.6612

# RORAIMA
    2.8398, -60.6487
    0.4870, -55.9335

# AMAPA
    0.8801, -51.7351

# PARA
    -5.0730, -50.6743

'''

insert_relay = [

    "INSERT INTO relay (nro_serie, fabricante, lat, long, alt, lanrgura_banda) values (001, 'SpaceX', -8.3262, -72.1138, 650, 70)",
    "INSERT INTO relay (nro_serie, fabricante, lat, long, alt, lanrgura_banda) values (002, 'SpaceX', -10.0282, -69.3149, 650, 70)",

    "INSERT INTO relay (nro_serie, fabricante, lat, long, alt, lanrgura_banda) values (003, 'SpaceX', -5.3889, -71.0087, 650, 70)",
    "INSERT INTO relay (nro_serie, fabricante, lat, long, alt, lanrgura_banda) values (004, 'SpaceX', -6.1522, -61.4996, 650, 70)",
    "INSERT INTO relay (nro_serie, fabricante, lat, long, alt, lanrgura_banda) values (005, 'SpaceX', -7.6725, -64.6612, 650, 70)",

    "INSERT INTO relay (nro_serie, fabricante, lat, long, alt, lanrgura_banda) values (006, 'SpaceX', 2.8398, -60.6487, 650, 70)",
    "INSERT INTO relay (nro_serie, fabricante, lat, long, alt, lanrgura_banda) values (007, 'SpaceX', 0.4870, -55.9335, 650, 70)",

    "INSERT INTO relay (nro_serie, fabricante, lat, long, alt, lanrgura_banda) values (008, 'SpaceX', 0.8801, -51.7351, 650, 70)",

    "INSERT INTO relay (nro_serie, fabricante, lat, long, alt, lanrgura_banda) values (009, 'SpaceX', -5.0730, -50.6743, 650, 70)"
    
]