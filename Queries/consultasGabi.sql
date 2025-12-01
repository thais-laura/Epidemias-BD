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
-- com base na contagem de casos registrados. Porem, se tiver empate, sera exibido tambem.

SELECT 
    c1.rede_de_saude,
    d.nomepopular AS doenca,
    c1.total_casos
FROM (
        -- Conta quantos casos cada doença tem por rede
        SELECT 
            c.rede_de_saude,
            c.doenca,
            COUNT(*) AS total_casos
        FROM caso c
        GROUP BY c.rede_de_saude, c.doenca
     ) c1
LEFT JOIN (
        -- Repete a mesma contagem para comparar frequências
        SELECT 
            c.rede_de_saude,
            c.doenca,
            COUNT(*) AS total_casos
        FROM caso c
        GROUP BY c.rede_de_saude, c.doenca
     ) c2
     ON c1.rede_de_saude = c2.rede_de_saude      -- só compara dentro da mesma rede
    AND c2.total_casos > c1.total_casos           -- pega doenças mais frequentes que c1
JOIN doenca d
    ON d.nomecientif = c1.doenca                  -- pega o nome popular
GROUP BY
    c1.rede_de_saude,
    c1.doenca,
    c1.total_casos,
    d.nomepopular
HAVING COUNT(c2.doenca) < 2       -- só mantém doenças que têm no máximo 1 doença acima delas
                                  -- ou seja: as 2 maiores (com empate possível)
ORDER BY
    c1.rede_de_saude,
    c1.total_casos DESC;          -- mostra das mais frequentes para as menos frequentes

