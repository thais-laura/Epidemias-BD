-- Consulta 1 - Thaís Laura
-- Pesquisar histórico de campanhas realizadas na região (com a quantidade de alertas, a doença e o beneficente mais recorrentes por região)
-- tabela usada como base para todas as outras consultas
with base as (
   select o.nome as regiao, -- join necessário devido à especialização
          al.doenca,
          al.beneficente as cnpj_beneficente
     from alerta al
     join abrange ab
   on al.idalerta = ab.idalerta
     join orgao o
   on ab.regiao_rede_de_saude = o.cnpj
),

-- escolhe a doença mais recorrente em alertas em cada região
doenca1 as (
   select regiao,
          doenca
     from (
      select regiao,
             doenca,
             count(*) as qtd,
             row_number()
             over(partition by regiao
                  order by count(*) desc -- ordena do maior para o menor
             ) as rn
        from base
       group by regiao,
                doenca
   )
    where rn = 1 -- o mais recorrente
),

-- escolhe o beneficente mais recorrente em alertas em cada região
benefic1 as (
   select br.regiao,
          o.nome as nome_beneficente -- join necessário devido à especialização
     from (
      select regiao,
             cnpj_beneficente,
             count(*) as qtd,
             row_number()
             over(partition by regiao
                  order by count(*) desc -- ordena do maior para o menor
             ) as rn
        from base
       group by regiao,
                cnpj_beneficente
   ) br
     join orgao o
   on br.cnpj_beneficente = o.cnpj
    where br.rn = 1 -- o mais recorrente
)

-- Para cada região, mostra a quantidade de alertas, a doença e o beneficente mais recorrentes
select b.regiao,
       count(*) as total_alertas, -- realiza a contagem aqui
       dt.doenca as doenca_mais_recorrente,
       bt.nome_beneficente as beneficente_mais_recorrente
  from base b
-- os joins são feitos com as tabelas intermediárias criadas acima
  join doenca_top dt
on dt.regiao = b.regiao
  join benef_top bt
on bt.regiao = b.regiao
 group by b.regiao,
          dt.doenca,
          bt.nome_beneficente
having count(*) > 2; -- no caso de haver mais de dois alertas na região