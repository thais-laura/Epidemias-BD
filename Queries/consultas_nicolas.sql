-- Consulta 1 – Nícolas
-- Objetivo:
-- Identificar os órgãos que fornecem serviços para a rede de saúde,
-- listando cada órgão que compõe a rede (tabela REDE_DE_SAUDE) e
-- agregando suas especialidades cadastradas.
-- A consulta relaciona REDE_DE_SAUDE com ORGAO e ESPECIALIDADES.
SELECT
    o.cnpj,
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


-- Consulta 2 – Nícolas
-- Objetivo:
-- Encontrar os beneficentes que mais alcançaram pessoas por meio de alertas
-- sobre doenças de alta letalidade (ex.: >= 0.70). A “quantidade de pessoas
-- alcançadas” é estimada somando a população (qtdHab) das cidades das regiões
-- abrangidas por cada Alerta.
-- A consulta cruza ALERTA, DOENCA, ABRANGE, REGIAO, CIDADE e BENEFICENTE.
SELECT
    b.cnpj AS beneficente,
    NVL(SUM(apa.pessoas_alcancadas), 0) AS total_pessoas_alcancadas,
    COUNT(apa.idalerta) AS qtde_alertas
FROM beneficente b
LEFT JOIN (
        -- Subconsulta equivalente ao alcance_por_alerta
        SELECT
            a.idalerta,
            a.beneficente,
            SUM(ci.qtdhab) AS pessoas_alcancadas
        FROM alerta a
        JOIN doenca d
            ON d.nomecientif = a.doenca
        JOIN abrange ab
            ON ab.idalerta = a.idalerta
        JOIN regiao r
            ON r.rede_de_saude = ab.regiao_rede_de_saude
        JOIN cidade ci
            ON ci.nome = r.nomecidade
           AND ci.estado = r.estadocidade
        WHERE d.letalidade >= 0.70
        GROUP BY a.idalerta, a.beneficente
    ) apa
    ON apa.beneficente = b.cnpj
GROUP BY b.cnpj
ORDER BY total_pessoas_alcancadas DESC, qtde_alertas DESC;
