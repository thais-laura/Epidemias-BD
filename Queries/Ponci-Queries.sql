--Consulta 1: Número de Casos de uma doença por Faixa Etária em uma cidade, por ano.
SELECT S3.ano_caso, COUNT(*) AS nro_casos , S3.faixa_etaria
FROM    (
        SELECT S2.idcaso,
        (TRUNC(months_between(S2.datainicio, p.datanascim) / 12)) AS idade,
        (CASE 
        WHEN (TRUNC(months_between(S2.datainicio, p.datanascim) / 12)) BETWEEN 0 AND 9  THEN 'CRIANCA'
        WHEN (TRUNC(months_between(S2.datainicio, p.datanascim) / 12)) BETWEEN 10 AND 19 THEN 'JOVEM'
        WHEN (TRUNC(months_between(S2.datainicio, p.datanascim) / 12)) BETWEEN 20 AND 59 THEN 'ADULTO'
        ELSE 'IDOSO' END) AS faixa_etaria,
        EXTRACT(YEAR FROM S2.datainicio) AS ano_caso
        FROM (SELECT c.idcaso, c.paciente, c.datainicio 
            FROM caso c JOIN (SELECT * -- Selecionar casos em redes que fazem parte de uma cidade específica
            FROM regiao r
            WHERE (r.nomecidade = 'SAO PAULO' AND r.estadocidade = 'SP')) S1
            ON ( c.REDE_DE_SAUDE = S1.rede_de_saude)
            WHERE c.doenca = 'SARS-COV-2' -- Restringir para uma doença
            ) S2 JOIN paciente p
            ON (S2.paciente=p.idpaciente)
        ) S3
        GROUP BY S3.ano_caso, S3.faixa_etaria
        ORDER BY S3.ano_caso DESC, S3.faixa_etaria;


--Consulta 2: Divisão; Todos os pacientes de uma cidade que tiveram casos de todas as doenças transmitidas por certo transmissor.

SELECT DISTINCT c1.paciente
FROM caso c1 JOIN (SELECT * 
            FROM regiao r
            WHERE (r.nomecidade = 'SAO PAULO' AND r.estadocidade = 'SP')) S1
    ON ( c1.REDE_DE_SAUDE = S1.rede_de_saude)
WHERE NOT EXISTS(   (SELECT doenca 
                    FROM transmite
                    WHERE transmissor = 'AR'
                    )
                MINUS
                    (
                    SELECT c.doenca
                    FROM caso c 
                    WHERE c1.paciente = c.paciente
                    )
                );


--Consulta 3: Divisão; Todas as cidades que tiveram casos de todas as doenças transmitidas por certo transmissor.

SELECT DISTINCT *
FROM cidade cid
WHERE NOT EXISTS(   (SELECT doenca 
                    FROM transmite
                    WHERE transmissor = 'AR'
                    )
                MINUS
                    (
                    SELECT c.doenca
                    FROM caso c JOIN regiao r
                    ON c.REDE_DE_SAUDE = r.rede_de_saude
                    WHERE (r.nomecidade = cid.nome AND r.estadocidade = cid.estado)
                    )
                );