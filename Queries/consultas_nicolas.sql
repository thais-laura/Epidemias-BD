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


