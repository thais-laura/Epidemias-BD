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
