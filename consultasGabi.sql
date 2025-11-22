-- Consulta 1 – Gabi
-- Objetivo:
-- Contar o número de óbitos por cidade, para cada doença registrada.
-- A consulta identifica os casos com óbito, relaciona-os com a doença
-- e localiza a cidade correspondente via a rede de saúde.

WITH casos_com_obito AS (
    -- Seleciona somente os casos onde houve óbito ('S').
    -- Também captura o CNPJ da rede de saúde responsável pelo caso.
    SELECT 
        c.idcaso,
        c.doenca,
        c.cnpj AS rede_de_saude
    FROM caso c
    WHERE c.obito = 'S'
),

obitos_por_doenca AS (
    -- Relaciona cada caso com óbito à doença correspondente.
    SELECT 
        co.idcaso,
        d.nomecientif,
        d.nomepopular,
        co.rede_de_saude
    FROM casos_com_obito co
    JOIN doenca d
      ON d.nomecientif = co.doenca
),

obitos_por_cidade AS (
    -- Determina em qual cidade ocorreu o caso com óbito.
    SELECT 
        od.nomecientif,
        od.nomepopular,
        rg.nomecidade,
        rg.estadocidade
    FROM obitos_por_doenca od
    JOIN regiao rg
      ON rg.rede_de_saude = od.rede_de_saude
)

-- Resultado:
-- Agrupa os óbitos por cidade e doença e faz a contagem.
SELECT 
    nomecidade,
    estadocidade,
    nomepopular AS doenca,
    COUNT(*) AS total_obitos
FROM obitos_por_cidade
GROUP BY nomecidade, estadocidade, nomepopular
ORDER BY total_obitos DESC;



-- Consulta 2 – Gabi
-- Objetivo:
-- Identificar, para cada rede de saúde, as duas doenças mais frequentes
-- com base na contagem de casos registrados.

WITH contagem_doencas AS (
    -- Conta quantos casos de cada doença ocorreram dentro de cada rede
    SELECT 
        c.cnpj AS rede_de_saude,
        c.doenca,
        COUNT(*) AS total_casos
    FROM caso c
    GROUP BY c.cnpj, c.doenca
),

ranking AS (
    -- Dentro de cada rede, ordena as doenças da mais frequente para a menos frequente
    SELECT
        cd.rede_de_saude,
        cd.doenca,
        cd.total_casos,
        -- Cria uma numeração dentro de cada rede de saúde
        -- PARTITION BY separa os dados por rede (uma lista para cada rede)
        -- ORDER BY organiza as doenças pela frequência
        ROW_NUMBER() OVER (
            PARTITION BY cd.rede_de_saude
            ORDER BY cd.total_casos DESC
        ) AS pos              -- posição da doença no ranking da rede (1 = mais frequente)

    FROM contagem_doencas cd  
)

-- Seleciona apenas as duas doenças mais comuns por rede
SELECT
    r.rede_de_saude,
    d.nomepopular AS doenca,
    r.total_casos
FROM ranking r
JOIN doenca d
  ON d.nomecientif = r.doenca
WHERE r.pos <= 2
ORDER BY r.rede_de_saude, r.total_casos DESC;
