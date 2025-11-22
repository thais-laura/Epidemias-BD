-- Consulta 1 - Thaís Laura
-- pesquisar histórico de campanhas realizadas na região (com a quantidade de alertas, a doença e o beneficente mais recorrentes por região)
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
doenca_top as (
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
    where rn = 1 -- seleciona o máximo
),

-- escolhe o beneficente mais recorrente em alertas em cada região
benef_top as (
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
    where br.rn = 1 -- seleciona o máximo
)

-- para cada região, mostra a quantidade de alertas, a doença e o beneficente mais recorrentes
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


-- Consulta 2 - Thaís Laura
-- verificar qual doenca tem o maior tempo medio para cada paciente (nomecientif e nomepopular), indicar qual é o tempo medio obtido
-- e ainda dizer se é maior que o tempo médio da doenca (para uma doença reincidente no paciente)

-- seleciona todas as doenças reincidentes de cada paciente
with doencas_reincidentes as (
   select distinct paciente,
                   doenca
     from caso
    where reincidente = '1'
),

-- calcula a média do período de infecção de cada doença, incluindo o primeiro caso da doença do paciente
medias_paciente as (
   select c.paciente,
          c.doenca,
          avg(c.data_fim - c.data_inicio) as tempo_medio_paciente
     from caso c
     join doencas_reincidentes dr
   on dr.paciente = c.paciente
      and dr.doenca = c.doenca
    group by c.paciente,
             c.doenca
),

-- ordena o tempo médio de cada doença por paciente
tempo_medio_top as (
   select mp.paciente,
          mp.doenca,
          mp.tempo_medio_paciente,
          d.nomepopular,
          d.tempo_medio as tempo_medio_doenca,
        -- dentro de cada partição (paciente), ordena o tempo médio de forma decrescente
          row_number()
          over(partition by mp.paciente
               order by mp.tempo_medio_paciente desc
          ) as rn
     from medias_paciente mp
     join doenca d
   on d.nomecientif = mp.doenca
)

-- para cada paciente, indica a doença mais recorrente, o tempo médio de infecção e se este é maior ou menor que o tempo geral da doença
select paciente,
       doenca,
       nomepopular,
       tempo_medio_paciente,
       tempo_medio_doenca,
       case
          when tempo_medio_paciente > tempo_medio_doenca then
             'maior'
          else
             'menor'
       end as comparacao
  from tempo_medio_top
 where rn = 1; -- seleciona o máximo