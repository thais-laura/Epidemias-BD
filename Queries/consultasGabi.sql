-- Consulta 1 – Gabi
-- Objetivo:
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

-- Consulta 2 – Gabi
-- Objetivo:
-- Identificar, para cada rede de saúde, as duas doenças mais frequentes
-- com base na contagem de casos registrados.

SELECT
    t.rede_de_saude,
    d.nomepopular AS doenca,
    t.total_casos
FROM (
        -- Subconsulta que conta e ranqueia as doenças por rede 
        SELECT
            c.rede_de_saude,
            c.doenca,
            COUNT(*) AS total_casos,
            -- ROW_NUMBER reinicia a contagem dentro de cada rede (PARTITION BY) e ordena pela quantidade de casos (ORDER BY).
            ROW_NUMBER() OVER (
                PARTITION BY c.rede_de_saude
                ORDER BY COUNT(*) DESC
            ) AS pos
        FROM caso c
        GROUP BY
            c.rede_de_saude,
            c.doenca
     ) t
    -- Mostra o nome popular ao invés do nome científico
    JOIN doenca d
        ON d.nomecientif = t.doenca
WHERE t.pos <= 2                    -- pega apenas as 2 mais frequentes
ORDER BY t.rede_de_saude,
         t.total_casos DESC;        -- mais frequentes primeiro
