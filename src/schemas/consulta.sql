-- Listar todas comunidades que receberam todos os dispositivos de uma única empresa
SELECT c.nome, e.nome as nome_empresa, COUNT(d.nro_serie) AS qtd_dispositivos
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

-- selecionar Nro de série e fabricante de todos os relays da base de dados, 
-- para os que se conectam a outro relay com latitude maior que -7.000 e longitude menor que -65.000 
-- retornar tambem a altitude do relay que se conecta
SELECT r1.nro_serie, r1.fabricante, r2.altitude 
	FROM relay_relay rr
	JOIN relay r1 ON r1.nro_serie = rr.relay1
	LEFT JOIN relay r2 ON r2.nro_serie = rr.relay1 AND r2.latitude > -7.000 AND r2.longitude < -65.000
	GROUP BY r1.nro_serie, r2.altitude;

-- -- Listar todos os dispositivos fornecidos pelas as empresas para as comunidades.
-- SELECT * FROM dispositivo d
-- 	JOIN dispositivo_comunidade_empresa dce ON d.nro_serie = dce.dispositivo
-- 	JOIN comunidade c ON dce.comunidade = c.registro
-- 	JOIN empresa e ON dce.empresa = e.cnpj

-- Selecionar nome e data_nasc dos usuarios, com dispositivo de tipo celular, em	
-- todas as	comunidades de roraima.
SELECT u.nome, u.data_nasc FROM usuario u,  	
	(SELECT ud.usuario FROM usuario_dispositivo ud
		JOIN dispositivo d ON ud.dispositivo = d.nro_serie AND UPPER(d.tipo) = 'CELULAR'
 	INTERSECT
 	SELECT uc.usuario FROM usuario_comunidade uc
		JOIN comunidade c ON uc.comunidade = c.registro AND UPPER(c.estado) = 'RORAIMA') 
	AS usuario_consulta
	WHERE u.cpf = usuario_consulta.usuario;

-- Listar os cpf e nome de todos os clientes que possuem um plano extra e estão numa comunidade que possuem
-- um plano extra, sendo plano extra qualquer um alem do simples.
-- Daqueles que possuem um dispositivo que se conectam a um satelite do hemisfério sul, listar o cidade, estado e a pais do cliente.
SELECT t1.nome, t1.cpf, t2.cidade, t2.estado, t2.pais FROM
	(SELECT u.nome, u.cpf 
		FROM usuario_comunidade uc 
		JOIN comunidade c ON uc.comunidade = c.registro and UPPER(c.plano) != 'COMUNITARIO SIMPLES'
		JOIN usuario u ON uc.usuario = u.cpf and UPPER(u.plano) != 'PESSOAL SIMPLES')
		AS t1
	LEFT JOIN
	(SELECT u.cidade, u.estado, u.pais, u.cpf
		FROM usuario u
		JOIN usuario_dispositivo ud ON u.cpf = ud.usuario
		JOIN dispositivo d ON d.nro_serie = ud.dispositivo
		JOIN relay_dispositivo rd ON rd.dispositivo = d.nro_serie
		JOIN relay r ON r.nro_serie = rd.relay AND r.latitude > -90 AND r.latitude < 0)
		AS t2
	ON t1.cpf = t2.cpf

-- todas as conexões de usuários/comunidades que uma estação teve em 2023
SELECT es.nro_serie, u.nome, c.nome, d.nro_serie, d.tipo, co.data FROM estacao es
	JOIN bridge b ON es.nro_serie = b.estacao
	JOIN relay_bridge rb ON b.nro_serie = rb.bridge
	JOIN relay r ON rb.relay = r.nro_serie
	JOIN relay_relay rr ON r.nro_serie = rr.relay1 
	JOIN conexao co ON co.relay = r.nro_serie
	JOIN dispositivo d ON d.nro_serie = co.dispositivo
	LEFT JOIN dispositivo_comunidade_empresa dce ON dce.dispositivo = d.nro_serie
	LEFT JOIN usuario_dispositivo ud ON ud.dispositivo = d.nro_serie
	LEFT JOIN usuario u ON u.cpf = ud.usuario
	LEFT JOIN comunidade c ON c.registro = dce.comunidade
	WHERE DATE_PART('month', co.data) = 06

-- os maiores consumos de cada usuário
SELECT u.nome, d.tipo, MAX(co.consumo), co.data FROM conexao co
	INNER JOIN dispositivo d ON d.nro_serie = co.dispositivo
	INNER JOIN usuario_dispositivo ud ON ud.dispositivo = d.nro_serie
	INNER JOIN usuario u ON u.cpf = ud.usuario
	GROUP BY u.nome, d.tipo, co.data, co.consumo
	ORDER BY co.consumo DESC
	
-- -- usuários que pertencem a, pelo menos, uma comunidade e que possua,
-- -- pelo menos, um dispositivo ordenados alfabeticamente
-- SELECT u.*, COUNT(*) AS qtd_dispositivos
-- 	FROM usuario u
-- 	JOIN usuario_comunidade uc ON u.cpf = uc.usuario
-- 	JOIN usuario_dispositivo ud ON u.cpf = ud.usuario
-- 	GROUP BY u.cpf
-- 	ORDER BY u.nome
