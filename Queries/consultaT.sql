-- pesquisar histórico de campanhas realizadas na região
-- para cada região, mostra a quantidade de alertas, a doença e o beneficente mais recorrentes
select o_rs.nome as regiao,
      (case when al.qtd_alertas is null then 0 else al.qtd_alertas end) as qtd_alertas,      -- número real de alertas
      dt.doenca,           -- doença mais recorrente
       o_b.nome as beneficente_mais_freq
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
                       row_number() over (
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
                       row_number() over (
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


-- para cada paciente, indica a doença recorrente com o maior tempo médio de infecção e se este é maior ou menor que o tempo geral da doença
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
          d.tempomedio as tempo_medio_doenca,
        -- dentro de cada partição (paciente), ordena o tempo médio de forma decrescente
          row_number()
          over(partition by mp.paciente
               order by mp.tempo_medio_paciente desc
          ) as rn
     from ( -- para cada paciente com sua doenca, tem a media da duracao
      select c.paciente,
             c.doenca,
             avg(c.datafim - c.datainicio) as tempo_medio_paciente
        from caso c
        join ( 
            -- todas os casos que tem doenças reincidentes
         select distinct paciente,
                         doenca
           from caso
          where reincidente = 'S'
      ) dr
      on dr.paciente = c.paciente
         and dr.doenca = c.doenca
       group by c.paciente,
                c.doenca
   ) mp
     join doenca d
   on d.nomecientif = mp.doenca
)
 where rn = 1 -- seleciona o máximo
 order by paciente;
