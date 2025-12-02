-- CONSULTA 1
-- Contar o número de óbitos por cidade, para cada doença registrada.
-- A consulta identifica os casos com óbito, relaciona-os com a doença
-- e localiza a cidade correspondente via a rede de saúde.
SELECT
    rg.nomecidade,
    rg.estadocidade,
    d.nomepopular AS doenca,
    COUNT(*) AS total_obitos
FROM caso c
    -- join na doença para obter nome popular
    JOIN doenca d
        ON d.nomecientif = c.doenca
    -- join na regiao para descobrir em qual cidade a rede atende 
    JOIN regiao rg
        ON rg.rede_de_saude = c.rede_de_saude
WHERE c.obito = 'S'      -- filtra apenas óbitos
GROUP BY
    rg.nomecidade,
    rg.estadocidade,
    d.nomepopular
ORDER BY
    total_obitos DESC;

-- CONSULTA 2
-- Identificar, para cada rede de saúde, as duas doenças mais frequentes
-- com base na contagem de casos registrados. Porem, se tiver empate, sera exibido tambem.

SELECT 
    o.nome AS nome_rede_saude,   -- nome da rede
    d.nomepopular AS doenca,
    c1.total_casos
FROM (
        -- conta quantos casos cada doença tem por rede
        SELECT 
            c.rede_de_saude,
            c.doenca,
            COUNT(*) AS total_casos
        FROM caso c
        GROUP BY c.rede_de_saude, c.doenca
     ) c1
LEFT JOIN (
        -- mesma contagem usada para comparar frequências
        SELECT 
            c.rede_de_saude,
            c.doenca,
            COUNT(*) AS total_casos
        FROM caso c
        GROUP BY c.rede_de_saude, c.doenca
     ) c2
     ON c1.rede_de_saude = c2.rede_de_saude      -- compara apenas dentro da mesma rede
    AND c2.total_casos > c1.total_casos           -- procura doenças mais frequentes que c1
JOIN doenca d
    ON d.nomecientif = c1.doenca                  -- obtém nome popular da doença
JOIN orgao o
    ON o.cnpj = c1.rede_de_saude                  -- obtém o nome da rede
GROUP BY
    o.nome,
    c1.rede_de_saude,
    c1.doenca,
    c1.total_casos,
    d.nomepopular
HAVING COUNT(c2.doenca) < 2       -- mantém apenas as 2 maiores frequências (com empate)
ORDER BY
    o.nome,                       -- ordena pelo nome da rede
    c1.total_casos DESC;          -- mostra primeiro as doenças mais frequentes

-- CONSULTA 3
-- pesquisar histórico de campanhas realizadas na região
-- para cada região, mostra a quantidade de alertas, a doença e o beneficente mais recorrentes
select o_rs.nome as regiao,
      (case when al.qtd_alertas is null then 0 else al.qtd_alertas end) as qtd_alertas,      -- número real de alertas
      (case when dt.doenca is null then 'nenhuma' else dt.doenca end) as doenca,           -- doença mais recorrente
      (case when o_b.nome is null then 'nenhuma' else o_b.nome end) as beneficente_mais_freq
  from rede_de_saude rs
  LEFT join orgao o_rs
    on rs.cnpj = o_rs.cnpj

  -- total de alertas por região (correto)
  left join (
        select regiao_rede_de_saude as regiao,
               count(*) as qtd_alertas
          from abrange
         group by regiao_rede_de_saude
       ) al
    on al.regiao = rs.cnpj

  -- beneficente mais recorrente
  left join (
        select *
          from (
                select ab.regiao_rede_de_saude as regiao,
                       al.beneficente,
                       count(*) as qtd,
                       dense_rank() over (
                           partition by ab.regiao_rede_de_saude
                           order by count(*) desc
                       ) rn
                  from alerta al
                  join abrange ab
                    on al.idalerta = ab.idalerta
                 group by ab.regiao_rede_de_saude, al.beneficente
               )
         where rn = 1
       ) bt
    on bt.regiao = rs.cnpj

  -- doença mais recorrente
  left join (
        select *
          from (
                select ab.regiao_rede_de_saude as regiao,
                       al.doenca,
                       count(*) as qtd,
                       dense_rank() over (
                           partition by ab.regiao_rede_de_saude
                           order by count(*) desc
                       ) rn
                  from alerta al
                  join abrange ab
                    on al.idalerta = ab.idalerta
                 group by ab.regiao_rede_de_saude, al.doenca
               )
         where rn = 1
       ) dt
    on dt.regiao = rs.cnpj

  left join orgao o_b
    on o_b.cnpj = bt.beneficente;

-- CONSULTA 4
-- para cada paciente, indica a doença recorrente com o maior tempo médio de infecção e se este é maior ou menor que o tempo geral da doença
select paciente,
       doenca,
       nomepopular,
       tempo_medio_paciente,
       case
          when tempo_medio_paciente > tempo_medio_doenca then
             'maior'
          when tempo_medio_paciente < tempo_medio_doenca then
             'menor'
          else
             'igual'
       end as comparacao,
       tempo_medio_doenca
  from (
    -- ordena o tempo médio de cada doenca por paciente
   select mp.paciente,
          mp.doenca,
          mp.tempo_medio_paciente,
          d.nomepopular,
          d.tempomedio as tempo_medio_doenca,
        -- dentro de cada partição (paciente), ordena o tempo médio de forma decrescente
          dense_rank() over(
            partition by mp.paciente
            order by mp.tempo_medio_paciente desc
          ) as rn
     from ( -- para cada paciente com sua doenca, tem a media da duracao
      select c.paciente,
             c.doenca,
             avg(c.datafim - c.datainicio) as tempo_medio_paciente
        from caso c
        join ( 
            -- todas os casos que tem doenças reincidentes
         select distinct paciente, doenca
           from caso
          where reincidente = 'S'
      ) dr
      on dr.paciente = c.paciente
         and dr.doenca = c.doenca
       group by c.paciente, c.doenca
   ) mp
     join doenca d
   on d.nomecientif = mp.doenca
)
 where rn = 1 -- seleciona o máximo
 order by paciente;


-- CONSULTA 5
--Número de Casos de uma doença por Faixa Etária em uma cidade, por ano.
SELECT S3.ano_caso, COUNT(*) AS nro_casos , S3.faixa_etaria
FROM    (
        SELECT S2.idcaso,
        (TRUNC(months_between(S2.datainicio, p.datanascim) / 12)) AS idade,
      -- Separacao por idade
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

-- CONSULTA 6
-- Divisão relacional
-- Todas as cidades que tiveram casos de todas as doenças transmitidas por certo transmissor.
SELECT DISTINCT *
FROM cidade cid
WHERE NOT EXISTS(   (SELECT doenca 
                    FROM transmite
                    WHERE transmissor = 'PESSOA INFECTADA'
                    )
                MINUS
                    (
                    SELECT c.doenca
                    FROM caso c JOIN regiao r
                    ON c.REDE_DE_SAUDE = r.rede_de_saude
                    WHERE (r.nomecidade = cid.nome AND r.estadocidade = cid.estado)
                    )
                );

-- CONSULTA 7
-- Lista todas as especialidades medicas oferecidas pelas redes de saude
SELECT
    o.nome,
    -- Agrupa todas as especialidades do órgão em uma única string
    LISTAGG(e.especialidade, ', ') WITHIN GROUP (ORDER BY e.especialidade) AS especialidades
FROM rede_de_saude r
JOIN orgao o
  ON o.cnpj = r.cnpj
LEFT JOIN especialidades e
  ON e.rede_de_saude = r.cnpj
GROUP BY o.cnpj, o.nome
ORDER BY o.nome;

