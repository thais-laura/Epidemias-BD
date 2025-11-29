-- pesquisar histórico de campanhas realizadas na região
-- para cada região, mostra a quantidade de alertas, a doença e o beneficente mais recorrentes
select o_rs.nome, -- nome da regiao
       count(*),   -- quantidade de alertas
       dt.doenca,  -- nome da doenca mais recorrente na regiao
       o_b.nome    -- nome do beneficente mais recorrente na regiao
  from rede_de_saude rs
  join orgao o_rs          -- obtem o nome da regiao
on rs.cnpj = o_rs.cnpj
  join ( -- escolhe o beneficente mais recorrente em alertas em cada região
   select *
     from (
      select ab.regiao_rede_de_saude as regiao, -- cnpj da regiao
             al.beneficente,                    -- cnpj do beneficente
             count(*) as qtd,                   -- qtd de vezes do beneficente em cada regiao
             row_number()
             over(partition by ab.regiao_rede_de_saude
                  order by count(*) desc -- ordena do maior para o menor
             ) as rn
        from alerta al
        join abrange ab
      on al.idalerta = ab.idalerta
       group by ab.regiao_rede_de_saude,
                al.beneficente
   )
    where rn = 1 -- seleciona o máximo
) bt
on rs.cnpj = bt.regiao
  join ( -- escolhe a doença mais recorrente em alertas em cada região
   select *
     from (
      select ab.regiao_rede_de_saude as regiao, -- cnpj da regiao
             al.doenca,                          -- doenca
             count(*) as qtd,                    -- qtd de vezes em cada regiao
             row_number()
             over(partition by ab.regiao_rede_de_saude
                  order by count(*) desc -- ordena do maior para o menor
             ) as rn
        from alerta al
        join abrange ab
      on al.idalerta = ab.idalerta
       group by ab.regiao_rede_de_saude,
                al.doenca
   )
    where rn = 1 -- seleciona o máximo
) dt
on rs.cnpj = dt.regiao
  join orgao o_b          -- obtem o nome do beneficente
on o_b.cnpj = bt.cnpj
 group by o_rs.nome,
          dt.doenca,
          o_b.nome
having count(*) >= 2; -- seleciona regiao somente com mais de 2 alertas


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
  from (
    -- ordena o tempo médio de cada doenca por paciente
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
     from ( -- para cada paciente com sua doenca, tem a media da duracao
      select c.paciente,
             c.doenca,
             avg(c.data_fim - c.data_inicio) as tempo_medio_paciente
        from caso c
        join ( 
            -- todas os casos que tem doenças reincidentes
         select distinct paciente,
                         doenca
           from caso
          where reincidente = '1'
      ) dr
      on dr.paciente = c.paciente
         and dr.doenca = c.doenca
       group by c.paciente,
                c.doenca
   ) mp
     join doenca d
   on d.nomecientif = mp.doenca
)
 where rn = 1; -- seleciona o máximo
