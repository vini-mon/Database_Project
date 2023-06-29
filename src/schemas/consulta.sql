-- números de série dos dispositivos que foram fornecidos por todas as
-- empresas para todas as comunidades.
SELECT e.nome, d.num_serie, COUNT(*) AS qtd
	FROM empresa e
	JOIN dispositivo_comunidade_empresa dce ON e.cnpj = dce.empresa
	JOIN comunidade c ON dce.comunidade = c.registro

	WHERE NOT EXISTS(

		SELECT d.nro_serie from dispositivo d
		WHERE NOT EXISTS(

			SELECT dce.dispositivo from dispositivo_comunidade_empresa dce
			WHERE dce.dispositivo = d.nro_serie
			AND dce.empresa = e.cnpj
			AND dce.comunidade = c.registro
		)

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
	FROM usuarios u
	JOIN usuario_comunidade uc ON u.cpf = uc.usuario
	JOIN usuario_dispositivos ud ON u.cpf = ud.usuario
	GROUP BY u.cpf
	ORDER BY u.nome

-- selecionar Nro de série e fabricante de todos os relays da base de dados, 
-- para os que se conectam a outro relay com latitude maior que -7.000 e longitude menor que -65.000 
-- retornar tambem a altitude do relay que se conecta
SELECT r1.nro_serie, r1.fabricante, r2.altitude 
	FROM relay_relay rr
	JOIN relay r1 ON r1.nro_serie = rr.relay1
	LEFT JOIN relay r2 ON r2.nro_serie = rr.relay1 and r2.latitude > -7.000 and r2.longitude < -65.000
	GROUP BY r1.nro_serie
	 
-- Selecionar nome e nusp dos alunos matriculados, em 2019, em	
-- todas as	disciplinas	ministradas	pelo professor com nfunc 123.	
select CPF, nome from usuario u where
 	NOT EXISTS ( (select sigla from disciplina where professor = 123)
 				MINUS
 				(select sigla from matricula where aluno = A.nusp and ano = 2019)
 	) 

-- Selecionar	nome	e	nusp	dos	alunos	matriculados,	em	2019,	em	
-- todas	as	disciplinas	ministradas	pelo	professor	com	nfunc	123

-- select nome, nusp from aluno A where
--  NOT EXISTS ((select sigla from disciplina where professor = 123)
-- 				MINUS
--  			(select sigla from matricula where aluno = A.nusp and ano = 2019)
--  )