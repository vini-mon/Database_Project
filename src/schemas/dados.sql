-- ## Tabela Pessoal ## 

INSERT INTO pessoal (nome, preco) values ('Pessoal Padrão', 0.00);
INSERT INTO pessoal (nome, preco) values ('Pessoal Simples', 99.90);
INSERT INTO pessoal (nome, preco) values ('Pessoal Extra', 149.90);


-- ## Tabela BenefícioPessoal ##

INSERT INTO beneficio_pessoal (plano, beneficio) values ('Pessoal Simples', '100 Mega Bytes de internet');
INSERT INTO beneficio_pessoal (plano, beneficio) values ('Pessoal Simples', 'Acesso 24 horas');
INSERT INTO beneficio_pessoal (plano, beneficio) values ('Pessoal Extra', '500 Mega Bytes de internet');
INSERT INTO beneficio_pessoal (plano, beneficio) values ('Pessoal Extra', 'Plano de Antivírus incluso');
INSERT INTO beneficio_pessoal (plano, beneficio) values ('Pessoal Extra', 'Acesso 24 horas');


-- ## Tabela Comunitário ##

INSERT INTO comunitario (nome, preco) values ('Comunitario Padrão', 0.00);
INSERT INTO comunitario (nome, preco) values ('Comunitario Simples', 299.99);
INSERT INTO comunitario (nome, preco) values ('Comunitario Extra', 499.99);


-- ## Tabela BenefícioComunitário ##

INSERT INTO beneficio_comunitario (plano, beneficio) values ('Comunitario Simples', '100 Mega Bytes de internet');
INSERT INTO beneficio_comunitario (plano, beneficio) values ('Comunitario Simples', 'Até 100 usuários simultâneos');
INSERT INTO beneficio_comunitario (plano, beneficio) values ('Comunitario Simples', 'Acesso 24 horas');
INSERT INTO beneficio_comunitario (plano, beneficio) values ('Comunitario Extra', '500 Mega Bytes de internet');
INSERT INTO beneficio_comunitario (plano, beneficio) values ('Comunitario Extra', 'Número ilimitado de usuários');
INSERT INTO beneficio_comunitario (plano, beneficio) values ('Comunitario Extra', 'Acesso 24 horas');


-- ## Tabela usuário ##

INSERT INTO usuario (cpf, nome, data_nasc, pais, estado, cidade, cep, rua, numero, plano, data_adesao, data_venc)
values ('444.136.372-91', 'João da Silva Santos', TO_DATE('29-06-1985', 'DD-MM-YYYY'), 'Brasil', 'Amazonas', 'Anori', '69440-000', 'R. Prof. Almir', 326, 'Pessoal Simples', TO_DATE('05-04-2015', 'DD-MM-YYYY'), TO_DATE('05-04-2025', 'DD-MM-YYYY'));

INSERT INTO usuario (cpf, nome, data_nasc, pais, estado, cidade, cep, rua, numero, plano, data_adesao, data_venc)
values ('011.654.052-45', 'Maria Oliveira Costa', TO_DATE('18-09-1990', 'DD-MM-YYYY'), 'Brasil', 'Acre', 'Xapuri', '69930-000', 'R. Marcos Antonio Gonçalves', 317, 'Pessoal Simples', TO_DATE('29-10-2014', 'DD-MM-YYYY'), TO_DATE('29-10-2024', 'DD-MM-YYYY'));

INSERT INTO usuario (cpf, nome, data_nasc, pais, estado, cidade, cep, rua, numero, plano, data_adesao, data_venc)
values ('465.040.701-05', 'José Oliveira Costa', TO_DATE('24-07-1978', 'DD-MM-YYYY'), 'Brasil', 'Acre', 'Mâncio Lima', '69990-000', 'R. Osvaldo Correia De Santana', 813, 'Pessoal Extra', TO_DATE('05-08-2016', 'DD-MM-YYYY'), TO_DATE('05-08-2023', 'DD-MM-YYYY'));

INSERT INTO usuario (cpf, nome, data_nasc, pais, estado, cidade, cep, rua, numero, plano, data_adesao, data_venc)
values ('378.697.441-15', 'Carlos Lima Costa', TO_DATE('03-09-2000', 'DD-MM-YYYY'), 'Brasil', 'Tocantis', 'Recursolândia', '77733-000', 'Rua Goiás', 366, 'Pessoal Simples', TO_DATE('05-02-2022', 'DD-MM-YYYY'), TO_DATE('05-02-2025', 'DD-MM-YYYY'));

INSERT INTO usuario (cpf, nome, data_nasc, pais, estado, cidade, cep, rua, numero, plano, data_adesao, data_venc)
values ('216.360.432-24', 'Ana Silva Santos', TO_DATE('25-10-1996', 'DD-MM-YYYY'), 'Brasil', 'Roraima', 'Uiramutã', '69358-000', 'R. Manoel Vieira', 289, 'Pessoal Extra', TO_DATE('14-07-2019', 'DD-MM-YYYY'), TO_DATE('14-07-2024', 'DD-MM-YYYY'));

INSERT INTO usuario (cpf, nome, data_nasc, pais, estado, cidade, cep, rua, numero, plano, data_adesao, data_venc)
values ('275.485.772-90', 'Lucas Almeida Pereira', TO_DATE('15-06-1992', 'DD-MM-YYYY'), 'Brasil', 'Amazonas', 'Tonantins', '69685-000', 'R. Álvaro Maia', 186, 'Pessoal Simples', TO_DATE('13-05-2010', 'DD-MM-YYYY'), TO_DATE('13-05-2025', 'DD-MM-YYYY'));

INSERT INTO usuario (cpf, nome, data_nasc, pais, estado, cidade, cep, rua, numero, plano, data_adesao, data_venc)
values ('500.047.672-76', 'Pedro Almeida Fernandes', TO_DATE('02-11-1991', 'DD-MM-YYYY'), 'Brasil', 'Roraima', 'Amajari', '69343-000', 'Avenida José Altino', 276, 'Pessoal Padrão', null ,null);

INSERT INTO usuario (cpf, nome, data_nasc, pais, estado, cidade, cep, rua, numero, plano, data_adesao, data_venc)
values ('864.076.055-12', 'Guilherme Gomes Ribeiro', TO_DATE('02-11-1991', 'DD-MM-YYYY'), 'Brasil', 'Roraima', 'Amajari', '69343-000', 'Avenida José Altino', 284, 'Pessoal Padrão', null ,null);


-- ## Tabela Dispositivo ##

INSERT INTO dispositivo (nro_serie, tipo) values ('rdQTBimmruuepJiDmVxC3J7gHYMNTj', 'notebook');
INSERT INTO dispositivo (nro_serie, tipo) values ('QTg8pjD6Bqm2e3Eqwdk4Sdah8nRxEb', 'celular');
INSERT INTO dispositivo (nro_serie, tipo) values ('7sRkk7usqKXaHiBnbq38k9pkqALA3y', 'tablet');
INSERT INTO dispositivo (nro_serie, tipo) values ('kKR3ap6TQTJ7eqxX2knpP2wSRdxpFc', 'celular');
INSERT INTO dispositivo (nro_serie, tipo) values ('r6c4TndrUJG4cdpUPQb3H5kLvF5eJC', 'celular');
INSERT INTO dispositivo (nro_serie, tipo) values ('YFXr3cug58LvhmqRaF8dqTL59V4KY5', 'drone');
INSERT INTO dispositivo (nro_serie, tipo) values ('UkNv4PSovX8YGhCLH75q9ePRhJRQ62', 'drone');

INSERT INTO dispositivo (nro_serie, tipo) values ('H6c4TndrUJG4cdpUPQb3H5kLvF5eJC', 'celular');


-- ## Tabela Usuário_Dispositivo ##

INSERT INTO usuario_dispositivo (dispositivo, usuario) values ('rdQTBimmruuepJiDmVxC3J7gHYMNTj', '378.697.441-15');
INSERT INTO usuario_dispositivo (dispositivo, usuario) values ('QTg8pjD6Bqm2e3Eqwdk4Sdah8nRxEb', '378.697.441-15');
INSERT INTO usuario_dispositivo (dispositivo, usuario) values ('7sRkk7usqKXaHiBnbq38k9pkqALA3y', '216.360.432-24');
INSERT INTO usuario_dispositivo (dispositivo, usuario) values ('kKR3ap6TQTJ7eqxX2knpP2wSRdxpFc', '444.136.372-91');
INSERT INTO usuario_dispositivo (dispositivo, usuario) values ('r6c4TndrUJG4cdpUPQb3H5kLvF5eJC', '500.047.672-76');
INSERT INTO usuario_dispositivo (dispositivo, usuario) values ('YFXr3cug58LvhmqRaF8dqTL59V4KY5', '864.076.055-12');
INSERT INTO usuario_dispositivo (dispositivo, usuario) values ('UkNv4PSovX8YGhCLH75q9ePRhJRQ62', '465.040.701-05');


-- ## Tabela Comunidade ##

INSERT INTO comunidade (registro, nome, qtd_membros, representante, pais, estado, cidade, complemento, plano, data_adesao, data_venc)
    values (1, 'Vila Tepequém', 150, 'Pedro Souza Mendes', 'Brasil', 'Roraima', 'Amajari', null, 'Comunitario Simples', TO_DATE('14-11-2021', 'DD-MM-YYYY'), TO_DATE('14-11-2023', 'DD-MM-YYYY'));
INSERT INTO comunidade (registro, nome, qtd_membros, representante, pais, estado, cidade, complemento, plano, data_adesao, data_venc)
    values (2, 'Aldeia Txoude', 50, 'Iaci Araraí Menezes', 'Brasil', 'Tocantins', 'Lagoa da Confusão', null, 'Comunitario Extra', TO_DATE('14-11-2012', 'DD-MM-YYYY'), TO_DATE('20-11-2023', 'DD-MM-YYYY'));
INSERT INTO comunidade (registro, nome, qtd_membros, representante, pais, estado, cidade, complemento, plano, data_adesao, data_venc)
    values (3, 'Aldeia Vila Mélia do Rio Jacaré', 250, 'Luiz Alves Pereira', 'Brasil', 'Roraima', 'Alto Alegre', null, 'Comunitario Padrão', TO_DATE('01-01-2021', 'DD-MM-YYYY'), TO_DATE('01-12-2023', 'DD-MM-YYYY'));


-- ## Tabela Usuário_Comunidade ##

INSERT INTO usuario_comunidade (usuario, comunidade) values ('500.047.672-76', 1);
INSERT INTO usuario_comunidade (usuario, comunidade) values ('864.076.055-12', 1);
INSERT INTO usuario_comunidade (usuario, comunidade) values ('444.136.372-91', 2);
INSERT INTO usuario_comunidade (usuario, comunidade) values ('011.654.052-45', 2);
INSERT INTO usuario_comunidade (usuario, comunidade) values ('465.040.701-05', 3);
INSERT INTO usuario_comunidade (usuario, comunidade) values ('378.697.441-15', 3);


-- ## Tabela Empresa ##

INSERT INTO empresa (cnpj, nome, razao_social, contato, pais, estado, cidade, cep, rua, numero)
    values ('13.648.825/0001-69', 'Empresa A', null, '(19) 2837-8266', 'Brasil', 'São Paulo', 'Campinas', '13035-420', 'R. Dr. Sales de Oliveira', 154);
INSERT INTO empresa (cnpj, nome, razao_social, contato, pais, estado, cidade, cep, rua, numero)
    values ('56.693.744/0001-93', 'Empresa B', null, 'empresaB@gmail.com', 'Brasil', 'Pernambuco', 'Recife', '50710-000', 'R. José Bonifácio', 1315);
INSERT INTO empresa (cnpj, nome, razao_social, contato, pais, estado, cidade, cep, rua, numero)
    values ('88.400.916/0001-80', 'Empresa C', null, '(97) 3351-5553', 'Brasil', 'Amazonas', 'Manaus', '69053-165', 'Av. Mário Ipiranga', 1300);


-- ## Tabela Dispositivo_Comunidade_Empresa ## ******************************

INSERT INTO dispositivo_comunidade_empresa (dispositivo, empresa, comunidade)
    values ('r6c4TndrUJG4cdpUPQb3H5kLvF5eJC', '88.400.916/0001-80', 1);
INSERT INTO dispositivo_comunidade_empresa (dispositivo, empresa, comunidade)
    values ('YFXr3cug58LvhmqRaF8dqTL59V4KY5', '88.400.916/0001-80', 1);
INSERT INTO dispositivo_comunidade_empresa (dispositivo, empresa, comunidade)
    values ('rdQTBimmruuepJiDmVxC3J7gHYMNTj', '56.693.744/0001-93', 3);
INSERT INTO dispositivo_comunidade_empresa (dispositivo, empresa, comunidade)
    values ('QTg8pjD6Bqm2e3Eqwdk4Sdah8nRxEb', '56.693.744/0001-93', 3);
INSERT INTO dispositivo_comunidade_empresa (dispositivo, empresa, comunidade)
    values ('kKR3ap6TQTJ7eqxX2knpP2wSRdxpFc', '13.648.825/0001-69', 2);
INSERT INTO dispositivo_comunidade_empresa (dispositivo, empresa, comunidade)
    values ('UkNv4PSovX8YGhCLH75q9ePRhJRQ62', '13.648.825/0001-69', 3);

INSERT INTO dispositivo_comunidade_empresa (dispositivo, empresa, comunidade)
    values ('H6c4TndrUJG4cdpUPQb3H5kLvF5eJC', '13.648.825/0001-69', 3);

-- ## Tabela Estação ##

INSERT INTO estacao (nro_serie, pais, estado, cidade, cep, rua, numero)
    values ('H9QMvCRhoVuep6HiuueEeHp83NruqL', 'Brasil', 'Acre', 'Rio Branco', '69900-000', 'Rua X', 123);
INSERT INTO estacao (nro_serie, pais, estado, cidade, cep, rua, numero)
    values ('BjahzpezBYFfbuTgByY45gM9QRLV8w', 'Brasil', 'Amazonas', 'Manaus', '69000-000', 'Rua Y', 456);
INSERT INTO estacao (nro_serie, pais, estado, cidade, cep, rua, numero)
    values ('JnWo8XRqPKB252PrbG3xoA3dPibhCq', 'Brasil', 'Roraima', 'Boa Vista', '69300-000', 'Rua Z', 789);
INSERT INTO estacao (nro_serie, pais, estado, cidade, cep, rua, numero)
    values ('fuxLvqMFMLePafyPG7UmkEm9Aa2zYX', 'Brasil', 'Tocantins', 'Palmas', '77000-000', 'Rua W', 987);


-- ## Tabela Provedor ##

INSERT INTO provedor (cnpj, nome, pais, estado, cidade, cep, rua, numero)
    values ('12.345.678/0001-01', 'Provedor A', 'Brasil', 'Acre', 'Rio Branco', '01234-567', 'Rua A', 123);
INSERT INTO provedor (cnpj, nome, pais, estado, cidade, cep, rua, numero)
    values ('98.765.432/0001-02', 'Provedor B', 'Brasil', 'Amazonas', 'Manaus', '12345-678', 'Rua B', 456);
INSERT INTO provedor (cnpj, nome, pais, estado, cidade, cep, rua, numero)
    values ('55.555.555/0001-03', 'Provedor C', 'Brasil', 'Roraima', 'Boa Vista', '54321-876', 'Rua C', 789);
INSERT INTO provedor (cnpj, nome, pais, estado, cidade, cep, rua, numero)
    values ('11.111.111/0001-04', 'Provedor D', 'Brasil', 'Pará', 'Belém', '98765-432', 'Rua D', 987);
INSERT INTO provedor (cnpj, nome, pais, estado, cidade, cep, rua, numero)
    values ('22.222.222/0001-05', 'Provedor E', 'Brasil', 'Tocantins', 'Palmas', '65432-187', 'Rua E', 654);


-- ## Tabela Estação_Provedor ##

INSERT INTO estacao_provedor (estacao, provedor) values ('H9QMvCRhoVuep6HiuueEeHp83NruqL', '12.345.678/0001-01');
INSERT INTO estacao_provedor (estacao, provedor) values ('BjahzpezBYFfbuTgByY45gM9QRLV8w', '98.765.432/0001-02');
INSERT INTO estacao_provedor (estacao, provedor) values ('JnWo8XRqPKB252PrbG3xoA3dPibhCq', '55.555.555/0001-03');
INSERT INTO estacao_provedor (estacao, provedor) values ('fuxLvqMFMLePafyPG7UmkEm9Aa2zYX', '22.222.222/0001-05');


-- ## Tabela Bridge ##

INSERT INTO bridge (nro_serie, fabricante, latitude, longitude, altitude, largura_banda, estacao)
    values ('yEhR9Mo8AvPzULCZAEzFRHoZirb9mj', 'SpaceX', -9.9829, -67.8206, 650, 70, 'H9QMvCRhoVuep6HiuueEeHp83NruqL');
INSERT INTO bridge (nro_serie, fabricante, latitude, longitude, altitude, largura_banda, estacao)
    values ('sak24LtXfG4P2ZqVeVXwVTwndHLHda', 'SpaceX', -3.0850, -60.0368, 650, 70, 'BjahzpezBYFfbuTgByY45gM9QRLV8w');
INSERT INTO bridge (nro_serie, fabricante, latitude, longitude, altitude, largura_banda, estacao)
    values ('Q3R9B7u85z6vAyK66uER8JFfbBPkBG', 'SpaceX', 2.8398, -60.6487, 650, 70, 'JnWo8XRqPKB252PrbG3xoA3dPibhCq');
INSERT INTO bridge (nro_serie, fabricante, latitude, longitude, altitude, largura_banda, estacao)
    values ('nojTqJ5FTtowPc3VZw4Swd2M6XUF2J', 'SpaceX', -10.2229, -48.3294, 650, 70, 'fuxLvqMFMLePafyPG7UmkEm9Aa2zYX');


-- ## Tabela Relay ##

--- AC
INSERT INTO relay (nro_serie, fabricante, latitude, longitude, altitude, largura_banda)
    values ('9LUdTmvN66KYv43Wa457ny7NQramHR', 'SpaceX', -8.3262, -72.1138, 650, 70);
INSERT INTO relay (nro_serie, fabricante, latitude, longitude, altitude, largura_banda)
    values ('7cfYxHaveeEk75qq39zuq4Rq8vCBjw', 'SpaceX', -10.0282, -69.3149, 650, 70);

--- AM
INSERT INTO relay (nro_serie, fabricante, latitude, longitude, altitude, largura_banda)
    values ('ch4URPX8rYgFvojLaW4WTtBpUPVFFP', 'SpaceX', -5.3889, -71.0087, 650, 70);
INSERT INTO relay (nro_serie, fabricante, latitude, longitude, altitude, largura_banda)
    values ('ziPpZT42tLkJDXjivvdxGSqiUSt4W8', 'SpaceX', -6.1522, -61.4996, 650, 70);
INSERT INTO relay (nro_serie, fabricante, latitude, longitude, altitude, largura_banda)
    values ('6NcvcS8r2KSUKXovPwjSe735KvYk45', 'SpaceX', -7.6725, -64.6612, 650, 70);

--- RR
INSERT INTO relay (nro_serie, fabricante, latitude, longitude, altitude, largura_banda)
    values ('PswAfV2WeYUjWVwpARWc32pKEd4QgZ', 'SpaceX', 0.4870, -55.9335, 650, 70);

--- AP
INSERT INTO relay (nro_serie, fabricante, latitude, longitude, altitude, largura_banda)
    values ('CxDG4zNmXQKCtgEnr8PbU5HbMM5job', 'SpaceX', 0.8801, -51.7351, 650, 70);

--- PA  
INSERT INTO relay (nro_serie, fabricante, latitude, longitude, altitude, largura_banda)
    values ('yaQopNKL4z6uMjXJikPoi4ZT9yLhFV', 'SpaceX', 0.4870, -55.9335, 650, 70);
INSERT INTO relay (nro_serie, fabricante, latitude, longitude, altitude, largura_banda)
    values ('48N8PrySoH5ycnbutMtRZ58KSa7gxH', 'SpaceX', -5.0730, -50.6743, 650, 70);


-- ## Tabela Relay_Relay ##

INSERT INTO relay_relay (relay1, relay2) values ('9LUdTmvN66KYv43Wa457ny7NQramHR', '7cfYxHaveeEk75qq39zuq4Rq8vCBjw');
INSERT INTO relay_relay (relay1, relay2) values ('7cfYxHaveeEk75qq39zuq4Rq8vCBjw', '9LUdTmvN66KYv43Wa457ny7NQramHR');
INSERT INTO relay_relay (relay1, relay2) values ('9LUdTmvN66KYv43Wa457ny7NQramHR', 'ch4URPX8rYgFvojLaW4WTtBpUPVFFP');
INSERT INTO relay_relay (relay1, relay2) values ('ch4URPX8rYgFvojLaW4WTtBpUPVFFP', '9LUdTmvN66KYv43Wa457ny7NQramHR');
INSERT INTO relay_relay (relay1, relay2) values ('ziPpZT42tLkJDXjivvdxGSqiUSt4W8', '6NcvcS8r2KSUKXovPwjSe735KvYk45');
INSERT INTO relay_relay (relay1, relay2) values ('6NcvcS8r2KSUKXovPwjSe735KvYk45', 'ziPpZT42tLkJDXjivvdxGSqiUSt4W8');
INSERT INTO relay_relay (relay1, relay2) values ('PswAfV2WeYUjWVwpARWc32pKEd4QgZ', 'CxDG4zNmXQKCtgEnr8PbU5HbMM5job');
INSERT INTO relay_relay (relay1, relay2) values ('CxDG4zNmXQKCtgEnr8PbU5HbMM5job', 'PswAfV2WeYUjWVwpARWc32pKEd4QgZ');
INSERT INTO relay_relay (relay1, relay2) values ('CxDG4zNmXQKCtgEnr8PbU5HbMM5job', '48N8PrySoH5ycnbutMtRZ58KSa7gxH');
INSERT INTO relay_relay (relay1, relay2) values ('48N8PrySoH5ycnbutMtRZ58KSa7gxH', 'CxDG4zNmXQKCtgEnr8PbU5HbMM5job');


-- ## Tabela Relay_Bridge ##

--- B1
INSERT INTO relay_bridge (relay, bridge) values ('7cfYxHaveeEk75qq39zuq4Rq8vCBjw', 'yEhR9Mo8AvPzULCZAEzFRHoZirb9mj');
INSERT INTO relay_bridge (relay, bridge) values ('6NcvcS8r2KSUKXovPwjSe735KvYk45', 'yEhR9Mo8AvPzULCZAEzFRHoZirb9mj');

--- B2
INSERT INTO relay_bridge (relay, bridge) values ('ziPpZT42tLkJDXjivvdxGSqiUSt4W8', 'sak24LtXfG4P2ZqVeVXwVTwndHLHda');
INSERT INTO relay_bridge (relay, bridge) values ('PswAfV2WeYUjWVwpARWc32pKEd4QgZ', 'sak24LtXfG4P2ZqVeVXwVTwndHLHda');

--- B3
INSERT INTO relay_bridge (relay, bridge) values ('yaQopNKL4z6uMjXJikPoi4ZT9yLhFV', 'Q3R9B7u85z6vAyK66uER8JFfbBPkBG');

--- B4
INSERT INTO relay_bridge (relay, bridge) values ('48N8PrySoH5ycnbutMtRZ58KSa7gxH', 'nojTqJ5FTtowPc3VZw4Swd2M6XUF2J');


-- ## Tabela Relay_Dispositivo ##

INSERT INTO relay_dispositivo (relay, dispositivo) values ('48N8PrySoH5ycnbutMtRZ58KSa7gxH', 'rdQTBimmruuepJiDmVxC3J7gHYMNTj');
INSERT INTO relay_dispositivo (relay, dispositivo) values ('PswAfV2WeYUjWVwpARWc32pKEd4QgZ', 'YFXr3cug58LvhmqRaF8dqTL59V4KY5');
INSERT INTO relay_dispositivo (relay, dispositivo) values ('PswAfV2WeYUjWVwpARWc32pKEd4QgZ', 'H6c4TndrUJG4cdpUPQb3H5kLvF5eJC');


-- ## Tabela Conexão ##

INSERT INTO conexao (relay, dispositivo, data, consumo)
    values ('48N8PrySoH5ycnbutMtRZ58KSa7gxH', 'rdQTBimmruuepJiDmVxC3J7gHYMNTj', TO_DATE('29-05-2023 15:30:00', 'DD-MM-YYYY HH24:MI:SS'), 0);
INSERT INTO conexao (relay, dispositivo, data, consumo)
    values ('48N8PrySoH5ycnbutMtRZ58KSa7gxH', 'rdQTBimmruuepJiDmVxC3J7gHYMNTj', TO_DATE('29-06-2023 15:30:00', 'DD-MM-YYYY HH24:MI:SS'), 215);
INSERT INTO conexao (relay, dispositivo, data, consumo)
    values ('PswAfV2WeYUjWVwpARWc32pKEd4QgZ', 'YFXr3cug58LvhmqRaF8dqTL59V4KY5', TO_DATE('27-06-2023 20:11:52', 'DD-MM-YYYY HH24:MI:SS'), 5182);
INSERT INTO conexao (relay, dispositivo, data, consumo)
    values ('PswAfV2WeYUjWVwpARWc32pKEd4QgZ', 'H6c4TndrUJG4cdpUPQb3H5kLvF5eJC', TO_DATE('04-04-2023 02:11:52', 'DD-MM-YYYY HH24:MI:SS'), 518);
INSERT INTO conexao (relay, dispositivo, data, consumo)
    values ('PswAfV2WeYUjWVwpARWc32pKEd4QgZ', 'H6c4TndrUJG4cdpUPQb3H5kLvF5eJC', TO_DATE('05-06-2023 20:12:52', 'DD-MM-YYYY HH24:MI:SS'), 118);
INSERT INTO conexao (relay, dispositivo, data, consumo)
    values ('PswAfV2WeYUjWVwpARWc32pKEd4QgZ', 'H6c4TndrUJG4cdpUPQb3H5kLvF5eJC', TO_DATE('04-06-2023 20:11:53', 'DD-MM-YYYY HH24:MI:SS'), 318);
INSERT INTO conexao (relay, dispositivo, data, consumo)
    values ('PswAfV2WeYUjWVwpARWc32pKEd4QgZ', 'H6c4TndrUJG4cdpUPQb3H5kLvF5eJC', TO_DATE('07-08-2023 20:11:52', 'DD-MM-YYYY HH24:MI:SS'), 58);
INSERT INTO conexao (relay, dispositivo, data, consumo)
    values ('PswAfV2WeYUjWVwpARWc32pKEd4QgZ', 'H6c4TndrUJG4cdpUPQb3H5kLvF5eJC', TO_DATE('08-03-2023 20:11:52', 'DD-MM-YYYY HH24:MI:SS'), 518);