insert into transmite (
   doenca,
   transmissor
) values ( 'PLASMODIUM FACILPARUM',
           'MOSQUITO ANOPHELES' ),( 'MYCOBACTERIUM TUBERCULOSIS',
                                    'PESSOA INFECTADA' ),( 'INFLUENZA VIRUS A',
                                                           'AR' ),( 'SARS-COV-2',
                                                                    'AR' );

insert into transmissor (
   nome,
   vetor,
   tipo,
   estacaoanopred,
   nomecientif,
   tempovida,
   regiaovivencia
) values ( 'MOSQUITO ANOPHELES',
           'MOSQUITO',
           'BIÓTICO',
           null,
           'ANOPHELES DARLINGI',
           30,
           'REGIÕES TROPICAIS E ÚMIDAS' ),( 'AR',
                                            'GOTÍCULAS DE AR',
                                            'ABIÓTICO',
                                            'INVERNO',
                                            null,
                                            null,
                                            'AMBIENTES FECHADOS E FRIOS' ),( 'CONTATO DIRETO',
                                                                             'CONTATO FÍSICO',
                                                                             'ABIÓTICO',
                                                                             'TODAS',
                                                                             null,
                                                                             null,
                                                                             'AMBIENTES URBANOS' ),( 'PESSOA INFECTADA',
                                                                                                     'HUMANO',
                                                                                                     'BIÓTICO',
                                                                                                     null,
                                                                                                     'HOMO SAPIENS',
                                                                                                     70,
                                                                                                     'MUNDO TODO' );

insert into doenca (
   nomecientif,
   nomepopular,
   letalidade,
   sazonalidade,
   cid10
) values ( 'PLASMODIUM FALCIPARUM',
           'MALÁRIA',
           0.2,
           'VERÃO',
           'B50' ),( 'MYCOBACTERIUM TUBERCULOSIS',
                     'TUBERCULOSE',
                     0.15,
                     'INVERNO',
                     'A15' ),( 'INFLUENZA VIRUS A',
                               'GRIPE',
                               0.01,
                               'OUTONO',
                               'J10' ),( 'SARS-COV-2',
                                         'COVID-19',
                                         0.03,
                                         'INVERNO',
                                         'U07.1' );
-- NÃO COLOQUEI TEMPO MÉDIO PQ SERIA CALCULADO COM BASE NOS CASOS

insert into sintomas (
   nomecientif,
   sintoma
) values ( 'PLASMODIUM FALCIPARUM',
           'FEBRE ALTA' ),( 'PLASMODIUM FALCIPARUM',
                            'CALAFRIOS E SUOR EXCESSIVO' ),( 'MYCOBACTERIUM TUBERCULOSIS',
                                                             'TOSSE PERSISTENTE COM CATARRO' ),( 'MYCOBACTERIUM TUBERCULOSIS'
                                                             ,
                                                                                                 'PERDA DE PESO E FADIGA' ),(
                                                                                                 'INFLUENZA VIRUS A',
                                                                                                                          'FEBRE E DOR DE CABEÇA'
                                                                                                                          ),(
                                                                                                                          'INFLUENZA VIRUS A'
                                                                                                                          ,
                                                                                                                                                  'CONGESTÃO NASAL E DOR MUSCULAR'
                                                                                                                                                  )
                                                                                                                                                  ,
                                                                                                                                                  (
                                                                                                                                                  'SARS-COV-2'
                                                                                                                                                  ,
                                                                                                                                                                                   'FEBRE E PERDA DE OLFATO'
                                                                                                                                                                                   )
                                                                                                                                                                                   ,
                                                                                                                                                                                   (
                                                                                                                                                                                   'SARS-COV-2'
                                                                                                                                                                                   ,
                                                                                                                                                                                                             'TOSSE SECA E DIFICULDADE PARA RESPIRAR'
                                                                                                                                                                                                             )
                                                                                                                                                                                                             ;

insert into agente (
   nomecientif,
   agente
) values ( 'PLASMODIUM FALCIPARUM',
           'PROTOZOÁRIO' ),( 'MYCOBACTERIUM TUBERCULOSIS',
                             'BACTÉRIA' ),( 'INFLUENZA VIRUS A',
                                            'VÍRUS' ),( 'SARS-COV-2',
                                                        'VÍRUS' );

insert into metodoprevencao (
   nomecientif,
   metodoprevencao
) values ( 'PLASMODIUM FALCIPARUM',
           'USO DE MOSQUITEIROS' ),( 'PLASMODIUM FALCIPARUM',
                                     'REPELENTES' ),( 'MYCOBACTERIUM TUBERCULOSIS',
                                                      'VACINAÇÃO BCG' ),( 'INFLUENZA VIRUS A',
                                                                          'VACINAÇÃO ANUAL' ),( 'INFLUENZA VIRUS A',
                                                                                                'HIGIENE DAS MÃOS' ),( 'SARS-COV-2'
                                                                                                ,
                                                                                                                       'USO DE MÁSCARAS'
                                                                                                                       ),( 'SARS-COV-2'
                                                                                                                       ,
                                                                                                                                         'ISOLAMENTO EM CASOS SUSPEITOS'
                                                                                                                                         )
                                                                                                                                         ;

insert into requer (
   doenca,
   tratamento
) values ( 'PLASMODIUM FALCIPARUM',
           'TRATAMENTO DA MALÁRIA' ),( 'MYCOBACTERIUM TUBERCULOSIS',
                                       'TRATAMENTO DA TUBERCULOSE' ),( 'INFLUENZA VIRUS A',
                                                                       'TRATAMENTO DA GRIPE' ),( 'SARS-COV-2',
                                                                                                 'TRATAMENTO DA COVID-19' ),(
                                                                                                 'SARS-COV-2',
                                                                                                                          'HEMODIÁLISE'
                                                                                                                          );

insert into tratamento (
   nome,
   tipo,
   remedio,
   customedio,
   duracaomedia,
   isolamento,
   maquina
) values ( 'TRATAMENTO DA MALÁRIA',
           'MEDICAMENTO',
           'ARTEMISININA',
           150.00,
           14,
           'NÃO',
           'NENHUMA' ),( 'TRATAMENTO DA TUBERCULOSE',
                         'MEDICAMENTO',
                         'RIFAMPICINA',
                         300.00,
                         180,
                         'NÃO',
                         'NENHUMA' ),( 'TRATAMENTO DA GRIPE',
                                       'MEDICAMENTO DE SUPORTE',
                                       'OSELTAMIVIR',
                                       80.00,
                                       7,
                                       'NÃO',
                                       'NENHUMA' ),( 'TRATAMENTO DA COVID-19',
                                                     'SUPORTE INTENSIVO',
                                                     'ANTIVIRAIS E CORTICOIDES',
                                                     500.00,
                                                     14,
                                                     'SIM',
                                                     'RESPIRADOR' ),( 'QUIMIOTERAPIA',
                                                                      'ONCOLÓGICO',
                                                                      'CISPLATINA',
                                                                      5000.00,
                                                                      120,
                                                                      'NÃO',
                                                                      'BOMBA DE INFUSÃO' ),( 'HEMODIÁLISE',
                                                                                             'SUPORTE RENAL',
                                                                                             'NENHUM',
                                                                                             800.00,
                                                                                             1,
                                                                                             'NÃO',
                                                                                             'MÁQUINA DE HEMODIÁLISE' );

insert into sessao (
   idsessao,
   idcaso,
   tratamento,
   data,
   hora,
   rede_de_saude,
   obsmedicas,
   resultadoesperado
) values ( 1,
           1,
           'TRATAMENTO DA GRIPE',
           to_date('12/03/24','DD/MM/YY'),
           to_date('09:30','HH24:MI'),
           '12.345.678/0001-90',
           'PACIENTE APRESENTOU FEBRE LEVE, RECEITADO OSELTAMIVIR.',
           'RECUPERAÇÃO TOTAL' ),( 2,
                                   2,
                                   'TRATAMENTO DA DENGUE',
                                   to_date('07/01/25','DD/MM/YY'),
                                   to_date('10:00','HH24:MI'),
                                   '12.345.678/0001-90',
                                   'HIDRATAÇÃO VENOSA E CONTROLE DE PLAQUETAS.',
                                   'ESTABILIZAÇÃO DO QUADRO' ),( 3,
                                                                 3,
                                                                 'TRATAMENTO DA COVID-19',
                                                                 to_date('15/02/23','DD/MM/YY'),
                                                                 to_date('14:15','HH24:MI'),
                                                                 '23.456.789/0001-80',
                                                                 'MONITORAMENTO RESPIRATÓRIO E USO DE ANTIVIRAIS.',
                                                                 'ALTA MÉDICA APÓS 10 DIAS' ),( 4,
                                                                                                4,
                                                                                                'TRATAMENTO DA COVID-19',
                                                                                                to_date('20/06/24','DD/MM/YY'
                                                                                                ),
                                                                                                to_date('09:45','HH24:MI'),
                                                                                                '23.456.789/0001-80',
                                                                                                'INTERNAÇÃO EM UTI LEVE, SEM NECESSIDADE DE VENTILAÇÃO MECÂNICA.'
                                                                                                ,
                                                                                                'MELHORA PROGRESSIVA' ),( 5,
                                                                                                                        5,
                                                                                                                        'TRATAMENTO DA TUBERCULOSE'
                                                                                                                        ,
                                                                                                                        to_date
                                                                                                                        ('15/10/23'
                                                                                                                        ,'DD/MM/YY'
                                                                                                                        ),
                                                                                                                        to_date
                                                                                                                        ('08:30'
                                                                                                                        ,'HH24:MI'
                                                                                                                        ),
                                                                                                                        '12.345.678/0001-90'
                                                                                                                        ,
                                                                                                                        'INÍCIO DO USO DE RIFAMPICINA, ACOMPANHAMENTO MENSAL.'
                                                                                                                        ,
                                                                                                                        'REDUÇÃO GRADUAL DOS SINTOMAS'
                                                                                                                        ),( 6
                                                                                                                        ,
                                                                                                                                                       6
                                                                                                                                                       ,
                                                                                                                                                       'TRATAMENTO DA GRIPE'
                                                                                                                                                       ,
                                                                                                                                                       to_date
                                                                                                                                                       (
                                                                                                                                                       '03/08/24'
                                                                                                                                                       ,
                                                                                                                                                       'DD/MM/YY'
                                                                                                                                                       )
                                                                                                                                                       ,
                                                                                                                                                       to_date
                                                                                                                                                       (
                                                                                                                                                       '11:20'
                                                                                                                                                       ,
                                                                                                                                                       'HH24:MI'
                                                                                                                                                       )
                                                                                                                                                       ,
                                                                                                                                                       '23.456.789/0001-80'
                                                                                                                                                       ,
                                                                                                                                                       'SINTOMAS LEVES, TRATADO EM AMBULATÓRIO.'
                                                                                                                                                       ,
                                                                                                                                                       'RECUPERAÇÃO SEM COMPLICAÇÕES'
                                                                                                                                                       )
                                                                                                                                                       ,
                                                                                                                                                       (
                                                                                                                                                       7
                                                                                                                                                       ,
                                                                                                                                                                                      7
                                                                                                                                                                                      ,
                                                                                                                                                                                      'TRATAMENTO DA COVID-19'
                                                                                                                                                                                      ,
                                                                                                                                                                                      to_date
                                                                                                                                                                                      (
                                                                                                                                                                                      '05/04/25'
                                                                                                                                                                                      ,
                                                                                                                                                                                      'DD/MM/YY'
                                                                                                                                                                                      )
                                                                                                                                                                                      ,
                                                                                                                                                                                      to_date
                                                                                                                                                                                      (
                                                                                                                                                                                      '16:00'
                                                                                                                                                                                      ,
                                                                                                                                                                                      'HH24:MI'
                                                                                                                                                                                      )
                                                                                                                                                                                      ,
                                                                                                                                                                                      '12.345.678/0001-90'
                                                                                                                                                                                      ,
                                                                                                                                                                                      'PACIENTE COM INSUFICIÊNCIA RESPIRATÓRIA GRAVE, ENTUBADO.'
                                                                                                                                                                                      ,
                                                                                                                                                                                      'ÓBITO PROVÁVEL'
                                                                                                                                                                                      )
                                                                                                                                                                                      ,
                                                                                                                                                                                      (
                                                                                                                                                                                      8
                                                                                                                                                                                      ,
                                                                                                                                                                                                       8
                                                                                                                                                                                                       ,
                                                                                                                                                                                                       'TRATAMENTO DA DENGUE'
                                                                                                                                                                                                       ,
                                                                                                                                                                                                       to_date
                                                                                                                                                                                                       (
                                                                                                                                                                                                       '15/02/25'
                                                                                                                                                                                                       ,
                                                                                                                                                                                                       'DD/MM/YY'
                                                                                                                                                                                                       )
                                                                                                                                                                                                       ,
                                                                                                                                                                                                       to_date
                                                                                                                                                                                                       (
                                                                                                                                                                                                       '13:00'
                                                                                                                                                                                                       ,
                                                                                                                                                                                                       'HH24:MI'
                                                                                                                                                                                                       )
                                                                                                                                                                                                       ,
                                                                                                                                                                                                       '12.345.678/0001-90'
                                                                                                                                                                                                       ,
                                                                                                                                                                                                       'HIDRATAÇÃO VENOSA E REPOUSO DOMICILIAR.'
                                                                                                                                                                                                       ,
                                                                                                                                                                                                       'MELHORA CLÍNICA'
                                                                                                                                                                                                       )
                                                                                                                                                                                                       ,
                                                                                                                                                                                                       (
                                                                                                                                                                                                       9
                                                                                                                                                                                                       ,
                                                                                                                                                                                                                         9
                                                                                                                                                                                                                         ,
                                                                                                                                                                                                                         'TRATAMENTO DA DENGUE'
                                                                                                                                                                                                                         ,
                                                                                                                                                                                                                         to_date
                                                                                                                                                                                                                         (
                                                                                                                                                                                                                         '02/07/25'
                                                                                                                                                                                                                         ,
                                                                                                                                                                                                                         'DD/MM/YY'
                                                                                                                                                                                                                         )
                                                                                                                                                                                                                         ,
                                                                                                                                                                                                                         to_date
                                                                                                                                                                                                                         (
                                                                                                                                                                                                                         '09:10'
                                                                                                                                                                                                                         ,
                                                                                                                                                                                                                         'HH24:MI'
                                                                                                                                                                                                                         )
                                                                                                                                                                                                                         ,
                                                                                                                                                                                                                         '12.345.678/0001-90'
                                                                                                                                                                                                                         ,
                                                                                                                                                                                                                         'RECORRÊNCIA LEVE, PACIENTE ORIENTADO A REPOUSO E HIDRATAÇÃO.'
                                                                                                                                                                                                                         ,
                                                                                                                                                                                                                         'RECUPERAÇÃO RÁPIDA'
                                                                                                                                                                                                                         )
                                                                                                                                                                                                                         ,
                                                                                                                                                                                                                         (
                                                                                                                                                                                                                         10
                                                                                                                                                                                                                         ,
                                                                                                                                                                                                                                              10
                                                                                                                                                                                                                                              ,
                                                                                                                                                                                                                                              'TRATAMENTO DA TUBERCULOSE'
                                                                                                                                                                                                                                              ,
                                                                                                                                                                                                                                              to_date
                                                                                                                                                                                                                                              (
                                                                                                                                                                                                                                              '20/05/24'
                                                                                                                                                                                                                                              ,
                                                                                                                                                                                                                                              'DD/MM/YY'
                                                                                                                                                                                                                                              )
                                                                                                                                                                                                                                              ,
                                                                                                                                                                                                                                              to_date
                                                                                                                                                                                                                                              (
                                                                                                                                                                                                                                              '10:00'
                                                                                                                                                                                                                                              ,
                                                                                                                                                                                                                                              'HH24:MI'
                                                                                                                                                                                                                                              )
                                                                                                                                                                                                                                              ,
                                                                                                                                                                                                                                              '12.345.678/0001-90'
                                                                                                                                                                                                                                              ,
                                                                                                                                                                                                                                              'CONTINUAÇÃO DO USO DE RIFAMPICINA E EXAMES DE CONTROLE.'
                                                                                                                                                                                                                                              ,
                                                                                                                                                                                                                                              'REMISSÃO DA INFECÇÃO'
                                                                                                                                                                                                                                              )
                                                                                                                                                                                                                                              ;

insert into caso (
   idcaso,
   paciente,
   doenca,
   datainicio,
   datafim,
   gravidade,
   rede_de_saude,
   obito,
   reincidente
) values ( 1,
           1,
           'INFLUENZA VIRUS A',
           to_date('10/03/24','DD/MM/YY'),
           to_date('20/03/24','DD/MM/YY'),
           'MODERADO',
           '12.345.678/0001-90',
           0,
           0 ),( 2,
                 2,
                 'DENV',
                 to_date('05/01/25','DD/MM/YY'),
                 null,
                 'GRAVE',
                 '12.345.678/0001-90',
                 0,
                 0 ),( 3,
                       3,
                       'SARS-COV-2',
                       to_date('12/02/23','DD/MM/YY'),
                       to_date('26/02/23','DD/MM/YY'),
                       'LEVE',
                       '23.456.789/0001-80',
                       0,
                       0 ),( 4,
                             3,
                             'SARS-COV-2',
                             to_date('15/06/24','DD/MM/YY'),
                             to_date('28/06/24','DD/MM/YY'),
                             'MODERADO',
                             '23.456.789/0001-80',
                             0,
                             1 ),( 5,
                                   4,
                                   'MYCOBACTERIUM TUBERCULOSIS',
                                   to_date('10/10/23','DD/MM/YY'),
                                   null,
                                   'GRAVE',
                                   '12.345.678/0001-90',
                                   0,
                                   0 ),( 6,
                                         5,
                                         'INFLUENZA VIRUS A',
                                         to_date('01/08/24','DD/MM/YY'),
                                         to_date('08/08/24','DD/MM/YY'),
                                         'LEVE',
                                         '23.456.789/0001-80',
                                         0,
                                         0 ),( 7,
                                               6,
                                               'SARS-COV-2',
                                               to_date('03/04/25','DD/MM/YY'),
                                               null,
                                               'GRAVE',
                                               '12.345.678/0001-90',
                                               1,
                                               0 ),( 8,
                                                     7,
                                                     'DENV',
                                                     to_date('10/02/25','DD/MM/YY'),
                                                     to_date('25/02/25','DD/MM/YY'),
                                                     'MODERADO',
                                                     '12.345.678/0001-90',
                                                     0,
                                                     0 ),( 9,
                                                           7,
                                                           'DENV',
                                                           to_date('30/06/25','DD/MM/YY'),
                                                           null,
                                                           'LEVE',
                                                           '12.345.678/0001-90',
                                                           0,
                                                           1 ),( 10,
                                                                 8,
                                                                 'MYCOBACTERIUM TUBERCULOSIS',
                                                                 to_date('15/05/24','DD/MM/YY'),
                                                                 to_date('15/09/24','DD/MM/YY'),
                                                                 'GRAVE',
                                                                 '12.345.678/0001-90',
                                                                 0,
                                                                 0 );

insert into metricas_sessoes (
   sessao,
   metrica,
   valor
) values ( 1,
           'TEMPERATURA CORPORAL',
           '38.1 °C' ),( 1,
                         'PRESSÃO ARTERIAL',
                         '120/80 MMHG' ),( 1,
                                           'FREQUÊNCIA CARDÍACA',
                                           '82 BPM' ),( 2,
                                                        'TEMPERATURA CORPORAL',
                                                        '39.0 °C' ),( 2,
                                                                      'PLAQUETAS',
                                                                      '95.000 /ΜL' ),( 2,
                                                                                       'PRESSÃO ARTERIAL',
                                                                                       '110/70 MMHG' ),( 3,
                                                                                                         'SATURAÇÃO DE O₂',
                                                                                                         '96 %' ),( 3,
                                                                                                                    'FREQUÊNCIA RESPIRATÓRIA'
                                                                                                                    ,
                                                                                                                    '18 IRPM'
                                                                                                                    ),( 3,
                                                                                                                              'TEMPERATURA CORPORAL'
                                                                                                                              ,
                                                                                                                              '37.4 °C'
                                                                                                                              )
                                                                                                                              ,
                                                                                                                              (
                                                                                                                              4
                                                                                                                              ,
                                                                                                                                        'SATURAÇÃO DE O₂'
                                                                                                                                        ,
                                                                                                                                        '93 %'
                                                                                                                                        )
                                                                                                                                        ,
                                                                                                                                        (
                                                                                                                                        4
                                                                                                                                        ,
                                                                                                                                               'FREQUÊNCIA RESPIRATÓRIA'
                                                                                                                                               ,
                                                                                                                                               '22 IRPM'
                                                                                                                                               )
                                                                                                                                               ,
                                                                                                                                               (
                                                                                                                                               4
                                                                                                                                               ,
                                                                                                                                                         'PRESSÃO ARTERIAL'
                                                                                                                                                         ,
                                                                                                                                                         '118/76 MMHG'
                                                                                                                                                         )
                                                                                                                                                         ,
                                                                                                                                                         (
                                                                                                                                                         5
                                                                                                                                                         ,
                                                                                                                                                                       'PESO CORPORAL'
                                                                                                                                                                       ,
                                                                                                                                                                       '72 KG'
                                                                                                                                                                       )
                                                                                                                                                                       ,
                                                                                                                                                                       (
                                                                                                                                                                       5
                                                                                                                                                                       ,
                                                                                                                                                                               'TOSSE PRODUTIVA'
                                                                                                                                                                               ,
                                                                                                                                                                               'SIM'
                                                                                                                                                                               )
                                                                                                                                                                               ,
                                                                                                                                                                               (
                                                                                                                                                                               5
                                                                                                                                                                               ,
                                                                                                                                                                                     'TEMPERATURA CORPORAL'
                                                                                                                                                                                     ,
                                                                                                                                                                                     '37.8 °C'
                                                                                                                                                                                     )
                                                                                                                                                                                     ,
                                                                                                                                                                                     (
                                                                                                                                                                                     6
                                                                                                                                                                                     ,
                                                                                                                                                                                               'TEMPERATURA CORPORAL'
                                                                                                                                                                                               ,
                                                                                                                                                                                               '36.9 °C'
                                                                                                                                                                                               )
                                                                                                                                                                                               ,
                                                                                                                                                                                               (
                                                                                                                                                                                               6
                                                                                                                                                                                               ,
                                                                                                                                                                                                         'PRESSÃO ARTERIAL'
                                                                                                                                                                                                         ,
                                                                                                                                                                                                         '115/75 MMHG'
                                                                                                                                                                                                         )
                                                                                                                                                                                                         ,
                                                                                                                                                                                                         (
                                                                                                                                                                                                         7
                                                                                                                                                                                                         ,
                                                                                                                                                                                                                       'SATURAÇÃO DE O₂'
                                                                                                                                                                                                                       ,
                                                                                                                                                                                                                       '82 %'
                                                                                                                                                                                                                       )
                                                                                                                                                                                                                       ,
                                                                                                                                                                                                                       (
                                                                                                                                                                                                                       7
                                                                                                                                                                                                                       ,
                                                                                                                                                                                                                              'FREQUÊNCIA RESPIRATÓRIA'
                                                                                                                                                                                                                              ,
                                                                                                                                                                                                                              '28 IRPM'
                                                                                                                                                                                                                              )
                                                                                                                                                                                                                              ,
                                                                                                                                                                                                                              (
                                                                                                                                                                                                                              7
                                                                                                                                                                                                                              ,
                                                                                                                                                                                                                                        'PRESSÃO ARTERIAL'
                                                                                                                                                                                                                                        ,
                                                                                                                                                                                                                                        '95/60 MMHG'
                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                        ,
                                                                                                                                                                                                                                        (
                                                                                                                                                                                                                                        8
                                                                                                                                                                                                                                        ,
                                                                                                                                                                                                                                                     'TEMPERATURA CORPORAL'
                                                                                                                                                                                                                                                     ,
                                                                                                                                                                                                                                                     '38.2 °C'
                                                                                                                                                                                                                                                     )
                                                                                                                                                                                                                                                     ,
                                                                                                                                                                                                                                                     (
                                                                                                                                                                                                                                                     8
                                                                                                                                                                                                                                                     ,
                                                                                                                                                                                                                                                               'PLAQUETAS'
                                                                                                                                                                                                                                                               ,
                                                                                                                                                                                                                                                               '120.000 /ΜL'
                                                                                                                                                                                                                                                               )
                                                                                                                                                                                                                                                               ,
                                                                                                                                                                                                                                                               (
                                                                                                                                                                                                                                                               8
                                                                                                                                                                                                                                                               ,
                                                                                                                                                                                                                                                                             'PRESSÃO ARTERIAL'
                                                                                                                                                                                                                                                                             ,
                                                                                                                                                                                                                                                                             '110/70 MMHG'
                                                                                                                                                                                                                                                                             )
                                                                                                                                                                                                                                                                             ,
                                                                                                                                                                                                                                                                             (
                                                                                                                                                                                                                                                                             9
                                                                                                                                                                                                                                                                             ,
                                                                                                                                                                                                                                                                                           'TEMPERATURA CORPORAL'
                                                                                                                                                                                                                                                                                           ,
                                                                                                                                                                                                                                                                                           '37.2 °C'
                                                                                                                                                                                                                                                                                           )
                                                                                                                                                                                                                                                                                           ,
                                                                                                                                                                                                                                                                                           (
                                                                                                                                                                                                                                                                                           9
                                                                                                                                                                                                                                                                                           ,
                                                                                                                                                                                                                                                                                                     'PLAQUETAS'
                                                                                                                                                                                                                                                                                                     ,
                                                                                                                                                                                                                                                                                                     '145.000 /ΜL'
                                                                                                                                                                                                                                                                                                     )
                                                                                                                                                                                                                                                                                                     ,
                                                                                                                                                                                                                                                                                                     (
                                                                                                                                                                                                                                                                                                     9
                                                                                                                                                                                                                                                                                                     ,
                                                                                                                                                                                                                                                                                                                   'PRESSÃO ARTERIAL'
                                                                                                                                                                                                                                                                                                                   ,
                                                                                                                                                                                                                                                                                                                   '115/72 MMHG'
                                                                                                                                                                                                                                                                                                                   )
                                                                                                                                                                                                                                                                                                                   ,
                                                                                                                                                                                                                                                                                                                   (
                                                                                                                                                                                                                                                                                                                   10
                                                                                                                                                                                                                                                                                                                   ,
                                                                                                                                                                                                                                                                                                                                 'TEMPERATURA CORPORAL'
                                                                                                                                                                                                                                                                                                                                 ,
                                                                                                                                                                                                                                                                                                                                 '37.5 °C'
                                                                                                                                                                                                                                                                                                                                 )
                                                                                                                                                                                                                                                                                                                                 ,
                                                                                                                                                                                                                                                                                                                                 (
                                                                                                                                                                                                                                                                                                                                 10
                                                                                                                                                                                                                                                                                                                                 ,
                                                                                                                                                                                                                                                                                                                                           'PESO CORPORAL'
                                                                                                                                                                                                                                                                                                                                           ,
                                                                                                                                                                                                                                                                                                                                           '70 KG'
                                                                                                                                                                                                                                                                                                                                           )
                                                                                                                                                                                                                                                                                                                                           ,
                                                                                                                                                                                                                                                                                                                                           (
                                                                                                                                                                                                                                                                                                                                           10
                                                                                                                                                                                                                                                                                                                                           ,
                                                                                                                                                                                                                                                                                                                                                   'TOSSE PRODUTIVA'
                                                                                                                                                                                                                                                                                                                                                   ,
                                                                                                                                                                                                                                                                                                                                                   'NÃO'
                                                                                                                                                                                                                                                                                                                                                   )
                                                                                                                                                                                                                                                                                                                                                   ;

insert into paciente (
   idpaciente,
   cpf,
   datanascim,
   sexo,
   gruporisco
) values ( 1,
           '12345678901',
           to_date('12/03/1985','DD/MM/YYYY'),
           'F',
           'SIM' ),( 2,
                     '98765432100',
                     to_date('25/07/1992','DD/MM/YYYY'),
                     'M',
                     'NÃO' ),( 3,
                               '45678912345',
                               to_date('03/11/1970','DD/MM/YYYY'),
                               'M',
                               'SIM' ),( 4,
                                         '32165498700',
                                         to_date('14/05/2001','DD/MM/YYYY'),
                                         'F',
                                         'NÃO' ),( 5,
                                                   '74185296300',
                                                   to_date('09/09/1958','DD/MM/YYYY'),
                                                   'M',
                                                   'SIM' ),( 6,
                                                             '85296374100',
                                                             to_date('20/12/1989','DD/MM/YYYY'),
                                                             'F',
                                                             'NÃO' ),( 7,
                                                                       '36925814700',
                                                                       to_date('17/02/2003','DD/MM/YYYY'),
                                                                       'F',
                                                                       'NÃO' ),( 8,
                                                                                 '15975348600',
                                                                                 to_date('28/10/1976','DD/MM/YYYY'),
                                                                                 'M',
                                                                                 'SIM' ),( 9,
                                                                                           '25814736900',
                                                                                           to_date('05/06/1999','DD/MM/YYYY')
                                                                                           ,
                                                                                           'F',
                                                                                           'NÃO' ),( 10,
                                                                                                     '96385274100',
                                                                                                     to_date('01/01/1960','DD/MM/YYYY'
                                                                                                     ),
                                                                                                     'M',
                                                                                                     'SIM' );

insert into vacinas (
   idpaciente,
   vacina
) values ( 1,
           'BCG' ),( 2,
                     'INFLUENZA' ),( 3,
                                     'COVID-19' ),( 5,
                                                    'FEBRE AMARELA' ),( 8,
                                                                        'COVID-19' );

insert into orgao (
   cnpj,
   nome,
   cep,
   bairro,
   logradouro,
   nro,
   telefone1,
   telefone2
) values ( '12.345.678/0001-90',
           'HOSPITAL SÃO LUCAS',
           '13560-970',
           'CENTRO',
           'RUA MAJOR JOSÉ INÁCIO',
           450,
           '(16) 3362-1234',
           '(16) 3362-5678' ),( '23.456.789/0001-80',
                                'CLÍNICA VIDA SAUDÁVEL',
                                '30140-120',
                                'SAVASSI',
                                'AV. CRISTÓVÃO COLOMBO',
                                900,
                                '(31) 3254-7788',
                                '(31) 3254-8899' ),( '34.567.890/0001-70',
                                                     'INSTITUTO ESPERANÇA',
                                                     '20040-001',
                                                     'CENTRO',
                                                     'RUA DA CARIOCA',
                                                     120,
                                                     '(21) 2223-4455',
                                                     '(21) 98888-1122' ),( '45.678.901/0001-60',
                                                                           'ONG SAÚDE PARA TODOS',
                                                                           '04012-090',
                                                                           'PARAÍSO',
                                                                           'RUA VERGUEIRO',
                                                                           1500,
                                                                           '(11) 3333-4444',
                                                                           '(11) 99999-5555' );

insert into tipo (
   orgao,
   tipo
) values ( '12.345.678/0001-90',
           'REDE DE SAUDE' ),( '12.345.678/0001-90',
                               'BENEFICENTE' ),( '23.456.789/0001-80',
                                                 'REDE DE SAUDE' ),( '34.567.890/0001-70',
                                                                     'BENEFICENTE' ),( '45.678.901/0001-60',
                                                                                       'BENEFICENTE' );


insert into cidade (
   nome,
   estado,
   qtdhab,
   areaterrit
) values ( 'SÃO CARLOS',
           'SP',
           254000,
           1137.00 ),( 'IPATINGA',
                       'MG',
                       270000,
                       165.00 ),( 'FORTALEZA',
                                  'CE',
                                  2687000,
                                  314.93 ),( 'BRASÍLIA',
                                             'DF',
                                             3055000,
                                             5802.00 ),( 'JACAREÍ',
                                                         'SP',
                                                         242000,
                                                         464.27 ),( 'SÃO PAULO',
                                                                    'SP',
                                                                    12300000,
                                                                    1521.11 ),( 'RIO DE JANEIRO',
                                                                                'RJ',
                                                                                6775000,
                                                                                1200.27 ),( 'BELO HORIZONTE',
                                                                                            'MG',
                                                                                            2533000,
                                                                                            331.40 ),( 'CURITIBA',
                                                                                                       'PR',
                                                                                                       1964000,
                                                                                                       434.89 ),( 'PORTO ALEGRE'
                                                                                                       ,
                                                                                                                  'RS',
                                                                                                                  1493000,
                                                                                                                  497.00 ),( 'RECIFE'
                                                                                                                  ,
                                                                                                                         'PE'
                                                                                                                         ,
                                                                                                                         1653000
                                                                                                                         ,
                                                                                                                         218.84
                                                                                                                         );


insert into beneficente (
   cnpj,
   qtdvolunt,
   datafundacao,
   areaatuacao
) values ( '12.345.678/0001-90',
           100,
           to_date('07/10/2004','DD/MM/YYYY'),
           'CAMPANHAS SOBRE CÂNCER DE MAMA' ),( '34.567.890/0001-70',
                                                45,
                                                to_date('12/03/2005','DD/MM/YYYY'),
                                                'APOIO A FAMÍLIAS CARENTES E CAMPANHAS DE VACINAÇÃO' ),( '45.678.901/0001-60'
                                                ,
                                                                                                         80,
                                                                                                         to_date('25/08/2010'
                                                                                                         ,'DD/MM/YYYY'),
                                                                                                         'AÇÕES DE SAÚDE COMUNITÁRIA E DOAÇÃO DE SANGUE'
                                                                                                         );

insert into rede_de_saude (
   cnpj,
   qtdleitos,
   qtdfuncion
) values ( '12.345.678/0001-90',
           250,
           500 ),( '23.456.789/0001-80',
                   120,
                   200 );

insert into regiao (
   rede_de_saude,
   raio,
   densidpop,
   nomecidade,
   estadocidade
) values ( '12.345.678/0001-90',
           15.0,
           223.5,
           'SÃO CARLOS',
           'SP' ),( '23.456.789/0001-80',
                    30.0,
                    526.7,
                    'BRASÍLIA',
                    'DF' );


insert into programa (
   beneficente,
   programa
) values ( '12.345.678/0001-90',
           'OUTUBRO ROSA – CONSCIENTIZAÇÃO SOBRE CÂNCER DE MAMA' ),( '12.345.678/0001-90',
                                                                     'MUTIRÃO DE EXAMES PREVENTIVOS' ),( '34.567.890/0001-70'
                                                                     ,
                                                                                                         'CAMPANHA DE VACINAÇÃO INFANTIL'
                                                                                                         ),( '34.567.890/0001-70'
                                                                                                         ,
                                                                                                                                          'DISTRIBUIÇÃO DE CESTAS BÁSICAS'
                                                                                                                                          )
                                                                                                                                          ,
                                                                                                                                          (
                                                                                                                                          '45.678.901/0001-60'
                                                                                                                                          ,
                                                                                                                                                                           'CAMPANHA DE DOAÇÃO DE SANGUE'
                                                                                                                                                                           )
                                                                                                                                                                           ,
                                                                                                                                                                           (
                                                                                                                                                                           '45.678.901/0001-60'
                                                                                                                                                                           ,
                                                                                                                                                                                                          'FEIRA DE SAÚDE E PREVENÇÃO DE DOENÇAS'
                                                                                                                                                                                                          )
                                                                                                                                                                                                          ,
                                                                                                                                                                                                          (
                                                                                                                                                                                                          '45.678.901/0001-60'
                                                                                                                                                                                                          ,
                                                                                                                                                                                                                                                  'ATENDIMENTO MÉDICO GRATUITO EM COMUNIDADES CARENTES'
                                                                                                                                                                                                                                                  )
                                                                                                                                                                                                                                                  ;

insert into especialidades (
   rede_de_saude,
   especialidade
) values ( '12.345.678/0001-90',
           'CLÍNICA GERAL' ),( '12.345.678/0001-90',
                               'PEDIATRIA' ),( '12.345.678/0001-90',
                                               'INFECTOLOGIA' ),( '12.345.678/0001-90',
                                                                  'CARDIOLOGIA' ),( '23.456.789/0001-80',
                                                                                    'ORTOPEDIA' ),( '23.456.789/0001-80',
                                                                                                    'GINECOLOGIA' ),( '23.456.789/0001-80'
                                                                                                    ,
                                                                                                                      'DERMATOLOGIA'
                                                                                                                      ),( '44.256.789/0001-20'
                                                                                                                      ,
                                                                                                                                     'NEUROLOGIA'
                                                                                                                                     )
                                                                                                                                     ,
                                                                                                                                     (
                                                                                                                                     '44.256.789/0001-20'
                                                                                                                                     ,
                                                                                                                                                  'PSIQUIATRIA'
                                                                                                                                                  )
                                                                                                                                                  ,
                                                                                                                                                  (
                                                                                                                                                  '44.256.789/0001-20'
                                                                                                                                                  ,
                                                                                                                                                                'ONCOLOGIA'
                                                                                                                                                                )
                                                                                                                                                                ;

insert into alerta (
   idalerta,
   beneficente,
   doenca,
   datainicio,
   datafim,
   tipo,
   mensagem,
   canalprinc,
   prioridade
) values ( 1,
           '12.345.678/0001-90',
           'SARS-COV-2',
           to_date('05/02/25','DD/MM/YY'),
           to_date('20/02/25','DD/MM/YY'),
           'PREVENÇÃO',
           'CAMPANHA DE CONSCIENTIZAÇÃO SOBRE A IMPORTÂNCIA DO USO DE MÁSCARAS E VACINAÇÃO CONTRA A COVID-19.',
           'REDES SOCIAIS',
           'ALTA' ),( 2,
                      '34.567.890/0001-70',
                      'DENV',
                      to_date('10/01/25','DD/MM/YY'),
                      to_date('31/03/25','DD/MM/YY'),
                      'CONTROLE VETORIAL',
                      'MUTIRÃO DE COMBATE AO MOSQUITO AEDES AEGYPTI EM BAIRROS DE MAIOR INCIDÊNCIA DE DENGUE.',
                      'RÁDIO COMUNITÁRIA',
                      'ALTA' ),( 3,
                                 '45.678.901/0001-60',
                                 'MYCOBACTERIUM TUBERCULOSIS',
                                 to_date('15/03/25','DD/MM/YY'),
                                 to_date('30/04/25','DD/MM/YY'),
                                 'CONSCIENTIZAÇÃO',
                                 'CAMPANHA INFORMATIVA SOBRE SINTOMAS E TRATAMENTO DA TUBERCULOSE, COM FOCO EM DIAGNÓSTICO PRECOCE.'
                                 ,
                                 'TELEVISÃO LOCAL',
                                 'MÉDIA' ),( 4,
                                             '34.567.890/0001-70',
                                             'INFLUENZA VIRUS A',
                                             to_date('01/05/25','DD/MM/YY'),
                                             to_date('30/06/25','DD/MM/YY'),
                                             'VACINAÇÃO',
                                             'CAMPANHA DE VACINAÇÃO CONTRA A GRIPE PARA GRUPOS DE RISCO.',
                                             'POSTOS DE SAÚDE',
                                             'ALTA' ),( 5,
                                                        '45.678.901/0001-60',
                                                        'SARS-COV-2',
                                                        to_date('10/07/25','DD/MM/YY'),
                                                        null,
                                                        'ACOMPANHAMENTO',
                                                        'MONITORAMENTO DE NOVOS CASOS DE COVID-19 E REFORÇO DA VACINAÇÃO DE REFORÇO.'
                                                        ,
                                                        'APLICATIVO DE SAÚDE',
                                                        'MÉDIA' );


insert into abrange (
   idalerta,
   rede_de_saude
) values ( 1,
           '12.345.678/0001-90' ),( 1,
                                    '23.456.789/0001-80' ),( 2,
                                                             '12.345.678/0001-90' ),( 3,
                                                                                      '23.456.789/0001-80' ),( 3,
                                                                                                               '44.256.789/0001-20'
                                                                                                               ),( 4,
                                                                                                                                    '44.256.789/0001-20'
                                                                                                                                    )
                                                                                                                                    ,
                                                                                                                                    (
                                                                                                                                    4
                                                                                                                                    ,
                                                                                                                                                         '12.345.678/0001-90'
                                                                                                                                                         )
                                                                                                                                                         ,
                                                                                                                                                         (
                                                                                                                                                         5
                                                                                                                                                         ,
                                                                                                                                                                              '12.345.678/0001-90'
                                                                                                                                                                              )
                                                                                                                                                                              ,
                                                                                                                                                                              (
                                                                                                                                                                              5
                                                                                                                                                                              ,
                                                                                                                                                                                                   '23.456.789/0001-80'
                                                                                                                                                                                                   )
                                                                                                                                                                                                   ;