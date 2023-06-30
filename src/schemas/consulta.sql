-- FINALIZADO
-- Listar todas comunidades que receberam todos os dispositivos de uma única empresa
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

-- FINALIZADO
-- selecionar Nro de série e fabricante de todos os relays da base de dados, 
-- para os que se conectam a outro relay com latitude maior que -7.000 e longitude menor que -65.000 
-- retornar tambem a altitude do relay que se conecta
SELECT r1.nro_serie, r1.fabricante, r2.altitude 
	FROM relay_relay rr
	JOIN relay r1 ON r1.nro_serie = rr.relay1
	LEFT JOIN relay r2 ON r2.nro_serie = rr.relay1 AND r2.latitude > -7.000 AND r2.longitude < -65.000
	GROUP BY r1.nro_serie, r2.altitude;

-- FINALIZADO
-- Listar todos os dispositivos fornecidos pelas as empresas para as comunidades.
SELECT * FROM dispositivo d
	JOIN dispositivo_comunidade_empresa dce ON d.nro_serie = dce.dispositivo
	JOIN comunidade c ON dce.comunidade = c.registro
	JOIN empresa e ON dce.empresa = e.cnpj

-- Listar os cpf e nome dos clientes que possuem um plano extra mesmo a comunidade
-- a que ele pertence possuindo um plano extra.
-- Daqueles que se encontram no hemisfério sul, listar o país e a cidade do cliente.
select 
	from 











	
-- usuários que pertencem a, pelo menos, uma comunidade e que possua,
-- pelo menos, um dispositivo ordenados alfabeticamente
SELECT u.*, COUNT(*) AS qtd_dispositivos
	FROM usuario u
	JOIN usuario_comunidade uc ON u.cpf = uc.usuario
	JOIN usuario_dispositivo ud ON u.cpf = ud.usuario
	GROUP BY u.cpf
	ORDER BY u.nome
	 
-- Selecionar nome e data_nasc dos usuarios, com dispositivo de tipo celular, em	
-- todas as	comunidades de roraima.
SELECT nome, data_nasc FROM usuario u WHERE EXISTS 
		((SELECT ud.usuario FROM usuario_dispositivo ud
			JOIN dispositivo d ON ud.dispositivo = d.nro_serie AND UPPER(d.tipo) = 'CELULAR')
 		INTERSECT
 		(SELECT uc.usuario FROM usuario_comunidade uc
			JOIN comunidade c ON uc.comunidade = c.registro AND UPPER(c.estado) = 'RORAIMA')
 	);

-- possibilidade 1
SELECT nome, data_nasc FROM usuario u WHERE NOT EXISTS 
		((SELECT ud.usuario FROM usuario_dispositivo ud
			JOIN dispositivo d ON ud.dispositivo = d.nro_serie AND UPPER(d.tipo) = 'CELULAR')
 		EXCEPT
 		(SELECT uc.usuario FROM usuario_comunidade uc
			JOIN comunidade c ON uc.comunidade = c.registro AND UPPER(c.estado) = 'RORAIMA')
 	);