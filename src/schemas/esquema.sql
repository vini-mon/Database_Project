-- ## Reset do banco
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

-- ## Criação das tabelas

-- Tabela Pessoal
create table pessoal(
    nome varchar(30),
    preco numeric(10,2),
    constraint pk_pessoal primary key (nome),
    constraint ck_preco check (preco >= 0)
);

-- Tabela Comunitário
create table comunitario(
    nome varchar(30),
    preco numeric(10,2),
    constraint pk_comunitario primary key (nome),
    constraint ck_preco check (preco >= 0)
);

-- Tabela usuário
create table usuario(
    cpf char(14),
    nome varchar(60),
    data_nasc date,
    pais varchar(30),
    estado varchar(30),
    cidade varchar(30),
    cep varchar(15), -- Pode mudar dependendo do país
    rua varchar(60),
    numero smallint,
    plano varchar(30) NOT NULL,
    data_adesao date,
    data_venc date,

    constraint pk_usuario primary key (cpf),
    constraint fk_usuario foreign key (plano) references pessoal(nome) on delete cascade,
    constraint ck_cpf check (regexp_like(cpf, '^[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}$')),
    constraint ck_data_nasc check (data_nasc < CURRENT_DATE),
    constraint ck_data_adesao_venc check (data_adesao < data_venc),
    constraint ck_data_venc check (data_venc >= CURRENT_DATE)
);

-- Tabela Dispositivo
create table dispositivo(
    nro_serie char(30),
    tipo varchar(30),
    constraint pk_dispositivo primary key (nro_serie)
);

-- Tabela BenefícioPessoal
create table beneficio_pessoal(
    plano varchar(30),
    beneficio varchar(50),
    constraint pk_beneficio_pessoal primary key (plano, beneficio)
);

-- Tabela BenefícioComunitário
create table beneficio_comunitario(
    plano varchar(30),
    beneficio varchar(50),
    constraint pk_beneficio_comunitario primary key (plano, beneficio)
);

-- Tabela Usuário_Dispositivo
create table usuario_dispositivo(
    dispositivo char(30),
    usuario char(14) not null,
    constraint pk_usuario_dispositivo primary key (dispositivo),
    constraint fk1_usuario_dispositivo foreign key (usuario) references usuario(cpf) on delete cascade,
    constraint fk2_usuario_dispositivo foreign key (dispositivo) references dispositivo(nro_serie) on delete cascade,
    constraint ck_usuario check (regexp_like(usuario, '^[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}$'))
);

-- Tabela Comunidade
create table comunidade(
    registro serial,
    nome varchar(60),
    qtd_membros integer,
    representante varchar(60),
    pais varchar(30),
    estado varchar(30),
    cidade varchar(30),
    complemento varchar(30),
    plano varchar(30) not null,
    data_adesao date,
    data_venc date,

    constraint pk_comunidade primary key (registro),
    constraint fk_comunidade foreign key (plano) references comunitario(nome) on delete cascade,
    constraint ck_qtd_membros check (qtd_membros > 0),
    constraint ck_data_adesao_venc check (data_adesao < data_venc),
    constraint ck_data_venc check (data_venc >= CURRENT_DATE)
);

-- Tabela Usuário_Comunidade
create table usuario_comunidade(
    usuario char(14),
    comunidade integer not null, -- registro da comunidade

    constraint pk_usuario_comunidade primary key (usuario),
    constraint fk1_usuario_comunidade foreign key (usuario) references usuario(cpf) on delete cascade,
    constraint fk2_usuario_comunidade foreign key (comunidade) references comunidade(registro) on delete cascade,
    constraint ck_usuario check (regexp_like(usuario, '^[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}$'))
);

-- Tabela Empresa
create table empresa(
    cnpj char(18),
    nome varchar(60),
    razao_social varchar(60),
    contato varchar(60),
    pais varchar(30),
    estado varchar(30),
    cidade varchar(30),
    cep varchar(15), -- Pode mudar dependendo do país
    rua varchar(60),
    numero smallint,

    constraint pk_empresa primary key (cnpj),
    constraint ck_cnpj check (regexp_like(cnpj, '^[0-9]{2}\.[0-9]{3}\.[0-9]{3}\/[0-9]{4}-[0-9]{2}$')),
    constraint ck_numero check (numero > 0)
);

-- Tabela Dispositivo_Comunidade_Empresa
create table dispositivo_comunidade_empresa(
    dispositivo char(30),
    empresa char(18),
    comunidade integer not null, -- registro da comunidade

    constraint pk_dispositivo_comunidade_empresa primary key (dispositivo, empresa),
    constraint fk1_dispositivo_comunidade_empresa foreign key (dispositivo) references dispositivo(nro_serie) on delete cascade,
    constraint fk2_dispositivo_comunidade_empresa foreign key (empresa) references empresa(cnpj) on delete cascade,
    constraint fk3_dispositivo_comunidade_empresa foreign key (comunidade) references comunidade(registro) on delete cascade
);

-- Tabela Estação
create table estacao(
    nro_serie char(30),
    pais varchar(30),
    estado varchar(30),
    cidade varchar(30),
    cep varchar(15), -- Pode mudar dependendo do país
    rua varchar(60),
    numero smallint,

    constraint pk_estacao primary key (nro_serie),
    constraint ck_numero check (numero > 0)
);

-- Tabela Provedor
create table provedor(
    cnpj char(18),
    nome varchar(60),
    pais varchar(30),
    estado varchar(30),
    cidade varchar(30),
    cep varchar(15), -- Pode mudar dependendo do país
    rua varchar(60),
    numero smallint,

    constraint pk_provedor primary key (cnpj),
    constraint ck_cnpj check (regexp_like(cnpj, '^[0-9]{2}\.[0-9]{3}\.[0-9]{3}\/[0-9]{4}-[0-9]{2}$')),
    constraint ck_numero check (numero > 0)
);

-- Tabela Estação_Provedor
create table estacao_provedor(
    estacao char(30),
    provedor char(18),

    constraint pk_estacao_provedor primary key (estacao, provedor),
    constraint fk1_estacao_provedor foreign key (estacao) references estacao(nro_serie) on delete cascade,
    constraint fk2_estacao_provedor foreign key (provedor) references provedor(cnpj) on delete cascade,
    constraint ck_estacao_provedor check (regexp_like(provedor, '^[0-9]{2}\.[0-9]{3}\.[0-9]{3}\/[0-9]{4}-[0-9]{2}$'))
);

-- Tabela Bridge
create table bridge(
    nro_serie char(30),
    fabricante varchar(60),
    largura_banda integer, -- medida em Mbps
    longitude numeric(11,8), -- -180 a 180
    latitude numeric(10,8), -- -90 a 90
    altitude numeric(10,2),
    estacao char(30) not null,

    constraint pk_bridge primary key (nro_serie),
    constraint fk_bridge foreign key (estacao) references estacao(nro_serie) on delete cascade,
    constraint ck_largura_banda check (largura_banda > 0),
    constraint ck_latitude check (latitude between -90 and 90),
    constraint ck_longitude check (longitude between -180 and 180),
    constraint ck_altitude check (altitude > 0)
);

-- Tabela Relay
create table relay(
    nro_serie char(30),
    fabricante varchar(60),
    largura_banda integer, -- medida em Mbps
    longitude numeric(11,8), -- -180 a 180
    latitude numeric(10,8), -- -90 a 90
    altitude numeric(10,2),

    constraint pk_relay primary key (nro_serie),
    constraint ck_largura_banda check (largura_banda > 0),
    constraint ck_latitude check (latitude between -90 and 90),
    constraint ck_longitude check (longitude between -180 and 180),
    constraint ck_altitude check (altitude > 0)
);

-- Tabela Relay_Relay
create table relay_relay(
    relay1 char(30),
    relay2 char(30),

    constraint pk_relay_relay primary key (relay1, relay2),
    constraint fk1_relay_relay foreign key (relay1) references relay(nro_serie) on delete cascade,
    constraint fk2_relay_relay foreign key (relay2) references relay(nro_serie) on delete cascade
);

-- Tabela Relay_Bridge
create table relay_bridge(
    relay char(30),
    bridge char(30) not null,

    constraint pk_relay_bridge primary key (relay),
    constraint fk1_relay_bridge foreign key (relay) references relay(nro_serie) on delete cascade,
    constraint fk2_relay_bridge foreign key (bridge) references bridge(nro_serie) on delete cascade
);

-- Tabela Relay_Dispositivo
create table relay_dispositivo(
    relay char(30),
    dispositivo char(30),

    unique(dispositivo),

    constraint pk_relay_dispositivo primary key (relay, dispositivo),
    constraint fk1_relay_dispositivo foreign key (relay) references relay(nro_serie) on delete cascade,
    constraint fk2_relay_dispositivo foreign key (dispositivo) references dispositivo(nro_serie) on delete cascade
);

-- Tabela Conexão
create table conexao(
    relay char(30),
    dispositivo char(30),
    data date, -- armazena tanto data quanto hora
    consumo integer, -- medida em Mbits

    constraint pk_conexao primary key (relay, dispositivo, data),
    constraint fk1_conexao foreign key (relay, dispositivo) references relay_dispositivo(relay, dispositivo) on delete cascade,
    constraint ck_consumo check (consumo >= 0)
);
