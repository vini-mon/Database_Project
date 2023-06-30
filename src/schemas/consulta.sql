-- comunidades que receberam todos os dispositivos de uma única empresa
SELECT c.nome, e.nome, COUNT(d.nro_serie) AS qtd_dispositivos
	FROM comunidade c
	JOIN dispositivo_comunidade_empresa dce ON c.registro = dce.comunidade
	JOIN empresa e ON dce.empresa = e.cnpj
	JOIN dispositivo d ON dce.dispositivo = d.nro_serie
	WHERE NOT EXISTS(
		SELECT * from dispositivo_comunidade_empresa dec2
		WHERE dec.id_comunidade = dec2.id_comunidade
    	AND dec.cnpj_empresa <> dec2.cnpj_empresa
	)
	GROUP BY c.nome
	HAVING COUNT(DISTINCT dec.empresa) = 1;







-- retornar o bridge que se conecta com todos os relays

INSERT INTO relay_bridge (relay, bridge) values ('ziPpZT42tLkJDXjivvdxGSqiUSt4W8', 'yEhR9Mo8AvPzULCZAEzFRHoZirb9mj');
INSERT INTO relay_bridge (relay, bridge) values ('ziPpZT42tLkJDXjivvdxGSqiUSt4W8', 'Q3R9B7u85z6vAyK66uER8JFfbBPkBG');
INSERT INTO relay_bridge (relay, bridge) values ('ziPpZT42tLkJDXjivvdxGSqiUSt4W8', 'nojTqJ5FTtowPc3VZw4Swd2M6XUF2J');

SELECT * FROM relay_bridge rb
	INNER JOIN relay r ON rb.relay = r.nro_serie
		
	WHERE NOT EXISTS(
		SELECT * from relay_bridge rb2
		WHERE rb2.relay = r.nro_serie
	);
	




-- todos os dispositivos que foram fornecidos por todas as empresas para
-- todas as comunidades.
SELECT * FROM dispositivos d
	JOIN dispositivo_comunidade_empresa dce ON d.nro_serie = dce.dispositivo
	JOIN comunidade c ON dce.comunidade = c.registro
	JOIN empresa e ON dce.empresa = e.cnpj
	
-- usuários que pertencem a, pelo menos, uma comunidade e que possua,
-- pelo menos, um dispositivo ordenados alfabeticamente
SELECT u.*, COUNT(*) AS qtd_dispositivos
	FROM usuario u
	JOIN usuario_comunidade uc ON u.cpf = uc.usuario
	JOIN usuario_dispositivo ud ON u.cpf = ud.usuario
	GROUP BY u.cpf
	ORDER BY u.nome

-- selecionar Nro de série e fabricante de todos os relays da base de dados, 
-- para os que se conectam a outro relay com latitude maior que -7.000 e longitude menor que -65.000 
-- retornar tambem a altitude do relay que se conecta

-- OK
SELECT r1.nro_serie, r1.fabricante, r2.altitude 
	FROM relay_relay rr
	JOIN relay r1 ON r1.nro_serie = rr.relay1
	LEFT JOIN relay r2 ON r2.nro_serie = rr.relay1 AND r2.latitude > -7.000 AND r2.longitude < -65.000
	GROUP BY r1.nro_serie, r2.altitude;
	 
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