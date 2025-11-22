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
           'BIOTICO',
           null,
           'ANOPHELES DARLINGI',
           30,
           'REGIOES TROPICAIS E UMIDAS' ),( 'AR',
                                            'GOTICULAS DE AR',
                                            'ABIOTICO',
                                            'INVERNO',
                                            null,
                                            null,
                                            'AMBIENTES FECHADOS E FRIOS' ),( 'CONTATO DIRETO',
                                                                             'CONTATO FISICO',
                                                                             'ABIOTICO',
                                                                             'TODAS',
                                                                             null,
                                                                             null,
                                                                             'AMBIENTES URBANOS' ),( 'PESSOA INFECTADA',
                                                                                                     'HUMANO',
                                                                                                     'BIOTICO',
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
           'MALARIA',
           0.2,
           'VERAO',
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
-- N COLOQUEI TEMPO MEDIO PQ SERIA CALCULADO COM BASE NOS CASOS

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
                                                                                                                          'FEBRE E DOR DE CABECA'
                                                                                                                          ),(
                                                                                                                          'INFLUENZA VIRUS A'
                                                                                                                          ,
                                                                                                                                                  'CONGESTAO NASAL E DOR MUSCULAR'
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
           'PROTOZOARIO' ),( 'MYCOBACTERIUM TUBERCULOSIS',
                             'BACTERIA' ),( 'INFLUENZA VIRUS A',
                                            'VIRUS' ),( 'SARS-COV-2',
                                                        'VIRUS' );

insert into metodoprevencao (
   nomecientif,
   metodoprevencao
) values ( 'PLASMODIUM FALCIPARUM',
           'USO DE MOSQUITEIROS' ),( 'PLASMODIUM FALCIPARUM',
                                     'REPELENTES' ),( 'MYCOBACTERIUM TUBERCULOSIS',
                                                      'VACINACAO BCG' ),( 'INFLUENZA VIRUS A',
                                                                          'VACINACAO ANUAL' ),( 'INFLUENZA VIRUS A',
                                                                                                'HIGIENE DAS MAOS' ),( 'SARS-COV-2'
                                                                                                ,
                                                                                                                       'USO DE MASCARAS'
                                                                                                                       ),( 'SARS-COV-2'
                                                                                                                       ,
                                                                                                                                         'ISOLAMENTO EM CASOS SUSPEITOS'
                                                                                                                                         )
                                                                                                                                         ;

insert into requer (
   doenca,
   tratamento
) values ( 'PLASMODIUM FALCIPARUM',
           'TRATAMENTO DA MALARIA' ),( 'MYCOBACTERIUM TUBERCULOSIS',
                                       'TRATAMENTO DA TUBERCULOSE' ),( 'INFLUENZA VIRUS A',
                                                                       'TRATAMENTO DA GRIPE' ),( 'SARS-COV-2',
                                                                                                 'TRATAMENTO DA COVID-19' ),(
                                                                                                 'SARS-COV-2',
                                                                                                                          'HEMODIALISE'
                                                                                                                          );

insert into tratamento (
   nome,
   tipo,
   remedio,
   customedio,
   duracaomedia,
   isolamento,
   maquina
) values ( 'TRATAMENTO DA MALARIA',
           'MEDICAMENTO',
           'ARTEMISININA',
           150.00,
           14,
           'N',
           'NENHUMA' ),( 'TRATAMENTO DA TUBERCULOSE',
                         'MEDICAMENTO',
                         'RIFAMPICINA',
                         300.00,
                         180,
                         'N',
                         'NENHUMA' ),( 'TRATAMENTO DA GRIPE',
                                       'MEDICAMENTO DE SUPORTE',
                                       'OSELTAMIVIR',
                                       80.00,
                                       7,
                                       'N',
                                       'NENHUMA' ),( 'TRATAMENTO DA COVID-19',
                                                     'SUPORTE INTENSIVO',
                                                     'ANTIVIRAIS E CORTICOIDES',
                                                     500.00,
                                                     14,
                                                     'S',
                                                     'RESPIRADOR' ),( 'QUIMIOTERAPIA',
                                                                      'ONCOLOGICO',
                                                                      'CISPLATINA',
                                                                      5000.00,
                                                                      120,
                                                                      'N',
                                                                      'BOMBA DE INFUSAO' ),( 'HEMODIALISE',
                                                                                             'SUPORTE RENAL',
                                                                                             'NENHUM',
                                                                                             800.00,
                                                                                             1,
                                                                                             'N',
                                                                                             'MAQUINA DE HEMODIALISE' );

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
           '12345678000190',
           'PACIENTE APRESENTOU FEBRE LEVE, RECEITADO OSELTAMIVIR.',
           'RECUPERACAO TOTAL' ),( 2,
                                   2,
                                   'TRATAMENTO DA DENGUE',
                                   to_date('07/01/25','DD/MM/YY'),
                                   to_date('10:00','HH24:MI'),
                                   '12345678000190',
                                   'HIDRATACAO VENOSA E CONTROLE DE PLAQUETAS.',
                                   'ESTABILIZACAO DO QUADRO' ),( 3,
                                                                 3,
                                                                 'TRATAMENTO DA COVID-19',
                                                                 to_date('15/02/23','DD/MM/YY'),
                                                                 to_date('14:15','HH24:MI'),
                                                                 '23456789000180',
                                                                 'MONITORAMENTO RESPIRATORIO E USO DE ANTIVIRAIS.',
                                                                 'ALTA MEDICA APOS 10 DIAS' ),( 4,
                                                                                                4,
                                                                                                'TRATAMENTO DA COVID-19',
                                                                                                to_date('20/06/24','DD/MM/YY'
                                                                                                ),
                                                                                                to_date('09:45','HH24:MI'),
                                                                                                '23456789000180',
                                                                                                'INTERNACAO EM UTI LEVE, SEM NECESSIDADE DE VENTILACAO MECANICA.'
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
                                                                                                                        '12345678000190'
                                                                                                                        ,
                                                                                                                        'INICIO DO USO DE RIFAMPICINA, ACOMPANHAMENTO MENSAL.'
                                                                                                                        ,
                                                                                                                        'REDUCAO GRADUAL DOS SINTOMAS'
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
                                                                                                                                                       '23456789000180'
                                                                                                                                                       ,
                                                                                                                                                       'SINTOMAS LEVES, TRATADO EM AMBULATORIO.'
                                                                                                                                                       ,
                                                                                                                                                       'RECUPERACAO SEM COMPLICACOES'
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
                                                                                                                                                                                      '12345678000190'
                                                                                                                                                                                      ,
                                                                                                                                                                                      'PACIENTE COM INSUFICIENCIA RESPIRATORIA GRAVE, ENTUBADO.'
                                                                                                                                                                                      ,
                                                                                                                                                                                      'OBITO PROVAVEL'
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
                                                                                                                                                                                                       '12345678000190'
                                                                                                                                                                                                       ,
                                                                                                                                                                                                       'HIDRATACAO VENOSA E REPOUSO DOMICILIAR.'
                                                                                                                                                                                                       ,
                                                                                                                                                                                                       'MELHORA CLINICA'
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
                                                                                                                                                                                                                         '12345678000190'
                                                                                                                                                                                                                         ,
                                                                                                                                                                                                                         'RECORRENCIA LEVE, PACIENTE ORIENTADO A REPOUSO E HIDRATACAO.'
                                                                                                                                                                                                                         ,
                                                                                                                                                                                                                         'RECUPERACAO RAPIDA'
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
                                                                                                                                                                                                                                              '12345678000190'
                                                                                                                                                                                                                                              ,
                                                                                                                                                                                                                                              'CONTINUACAO DO USO DE RIFAMPICINA E EXAMES DE CONTROLE.'
                                                                                                                                                                                                                                              ,
                                                                                                                                                                                                                                              'REMISSAO DA INFECCAO'
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
           '12345678000190',
           0,
           0 ),( 2,
                 2,
                 'DENV',
                 to_date('05/01/25','DD/MM/YY'),
                 null,
                 'GRAVE',
                 '12345678000190',
                 0,
                 0 ),( 3,
                       3,
                       'SARS-COV-2',
                       to_date('12/02/23','DD/MM/YY'),
                       to_date('26/02/23','DD/MM/YY'),
                       'LEVE',
                       '23456789000180',
                       0,
                       0 ),( 4,
                             3,
                             'SARS-COV-2',
                             to_date('15/06/24','DD/MM/YY'),
                             to_date('28/06/24','DD/MM/YY'),
                             'MODERADO',
                             '23456789000180',
                             0,
                             1 ),( 5,
                                   4,
                                   'MYCOBACTERIUM TUBERCULOSIS',
                                   to_date('10/10/23','DD/MM/YY'),
                                   null,
                                   'GRAVE',
                                   '12345678000190',
                                   0,
                                   0 ),( 6,
                                         5,
                                         'INFLUENZA VIRUS A',
                                         to_date('01/08/24','DD/MM/YY'),
                                         to_date('08/08/24','DD/MM/YY'),
                                         'LEVE',
                                         '23456789000180',
                                         0,
                                         0 ),( 7,
                                               6,
                                               'SARS-COV-2',
                                               to_date('03/04/25','DD/MM/YY'),
                                               null,
                                               'GRAVE',
                                               '12345678000190',
                                               1,
                                               0 ),( 8,
                                                     7,
                                                     'DENV',
                                                     to_date('10/02/25','DD/MM/YY'),
                                                     to_date('25/02/25','DD/MM/YY'),
                                                     'MODERADO',
                                                     '12345678000190',
                                                     0,
                                                     0 ),( 9,
                                                           7,
                                                           'DENV',
                                                           to_date('30/06/25','DD/MM/YY'),
                                                           null,
                                                           'LEVE',
                                                           '12345678000190',
                                                           0,
                                                           1 ),( 10,
                                                                 8,
                                                                 'MYCOBACTERIUM TUBERCULOSIS',
                                                                 to_date('15/05/24','DD/MM/YY'),
                                                                 to_date('15/09/24','DD/MM/YY'),
                                                                 'GRAVE',
                                                                 '12345678000190',
                                                                 0,
                                                                 0 );

insert into metricas_sessoes (
   sessao,
   metrica,
   valor
) values ( 1,
           'TEMPERATURA CORPORAL',
           '38.1 °C' ),( 1,
                         'PRESSAO ARTERIAL',
                         '120/80 MMHG' ),( 1,
                                           'FREQUENCIA CARDIACA',
                                           '82 BPM' ),( 2,
                                                        'TEMPERATURA CORPORAL',
                                                        '39.0 °C' ),( 2,
                                                                      'PLAQUETAS',
                                                                      '95.000 /ΜL' ),( 2,
                                                                                       'PRESSAO ARTERIAL',
                                                                                       '110/70 MMHG' ),( 3,
                                                                                                         'SATURACAO DE O2',
                                                                                                         '96 %' ),( 3,
                                                                                                                    'FREQUENCIA RESPIRATORIA'
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
                                                                                                                                        'SATURACAO DE O2'
                                                                                                                                        ,
                                                                                                                                        '93 %'
                                                                                                                                        )
                                                                                                                                        ,
                                                                                                                                        (
                                                                                                                                        4
                                                                                                                                        ,
                                                                                                                                               'FREQUENCIA RESPIRATORIA'
                                                                                                                                               ,
                                                                                                                                               '22 IRPM'
                                                                                                                                               )
                                                                                                                                               ,
                                                                                                                                               (
                                                                                                                                               4
                                                                                                                                               ,
                                                                                                                                                         'PRESSAO ARTERIAL'
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
                                                                                                                                                                               'S'
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
                                                                                                                                                                                                       'PRESSAO ARTERIAL'
                                                                                                                                                                                                       ,
                                                                                                                                                                                                       '115/75 MMHG'
                                                                                                                                                                                                       )
                                                                                                                                                                                                       ,
                                                                                                                                                                                                       (
                                                                                                                                                                                                       7
                                                                                                                                                                                                       ,
                                                                                                                                                                                                                     'SATURACAO DE O2'
                                                                                                                                                                                                                     ,
                                                                                                                                                                                                                     '82 %'
                                                                                                                                                                                                                     )
                                                                                                                                                                                                                     ,
                                                                                                                                                                                                                     (
                                                                                                                                                                                                                     7
                                                                                                                                                                                                                     ,
                                                                                                                                                                                                                            'FREQUENCIA RESPIRATORIA'
                                                                                                                                                                                                                            ,
                                                                                                                                                                                                                            '28 IRPM'
                                                                                                                                                                                                                            )
                                                                                                                                                                                                                            ,
                                                                                                                                                                                                                            (
                                                                                                                                                                                                                            7
                                                                                                                                                                                                                            ,
                                                                                                                                                                                                                                      'PRESSAO ARTERIAL'
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
                                                                                                                                                                                                                                                                           'PRESSAO ARTERIAL'
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
                                                                                                                                                                                                                                                                                                                 'PRESSAO ARTERIAL'
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
                                                                                                                                                                                                                                                                                                                                                 'N'
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
           'S' ),( 2,
                   '98765432100',
                   to_date('25/07/1992','DD/MM/YYYY'),
                   'M',
                   'N' ),( 3,
                           '45678912345',
                           to_date('03/11/1970','DD/MM/YYYY'),
                           'M',
                           'S' ),( 4,
                                   '32165498700',
                                   to_date('14/05/2001','DD/MM/YYYY'),
                                   'F',
                                   'N' ),( 5,
                                           '74185296300',
                                           to_date('09/09/1958','DD/MM/YYYY'),
                                           'M',
                                           'S' ),( 6,
                                                   '85296374100',
                                                   to_date('20/12/1989','DD/MM/YYYY'),
                                                   'F',
                                                   'N' ),( 7,
                                                           '36925814700',
                                                           to_date('17/02/2003','DD/MM/YYYY'),
                                                           'F',
                                                           'N' ),( 8,
                                                                   '15975348600',
                                                                   to_date('28/10/1976','DD/MM/YYYY'),
                                                                   'M',
                                                                   'S' ),( 9,
                                                                           '25814736900',
                                                                           to_date('05/06/1999','DD/MM/YYYY'),
                                                                           'F',
                                                                           'N' ),( 10,
                                                                                   '96385274100',
                                                                                   to_date('01/01/1960','DD/MM/YYYY'),
                                                                                   'M',
                                                                                   'S' );

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
) values ( '12345678000190',
           'HOSPITAL SAO LUCAS',
           '13560-970',
           'CENTRO',
           'RUA MAJOR JOSE INACIO',
           450,
           '(16) 3362-1234',
           '(16) 3362-5678' ),( '23456789000180',
                                'CLINICA VIDA SAUDAVEL',
                                '30140-120',
                                'SAVASSI',
                                'AV. CRISTOVAO COLOMBO',
                                900,
                                '(31) 3254-7788',
                                '(31) 3254-8899' ),( '34567890000170',
                                                     'INSTITUTO ESPERANCA',
                                                     '20040-001',
                                                     'CENTRO',
                                                     'RUA DA CARIOCA',
                                                     120,
                                                     '(21) 2223-4455',
                                                     '(21) 98888-1122' ),( '45678901000160',
                                                                           'ONG SAUDE PARA TODOS',
                                                                           '04012-090',
                                                                           'PARAISO',
                                                                           'RUA VERGUEIRO',
                                                                           1500,
                                                                           '(11) 3333-4444',
                                                                           '(11) 99999-5555' );

insert into tipo (
   orgao,
   tipo
) values ( '12345678000190',
           'REDE DE SAUDE' ),( '12345678000190',
                               'BENEFICENTE' ),( '23456789000180',
                                                 'REDE DE SAUDE' ),( '34567890000170',
                                                                     'BENEFICENTE' ),( '45678901000160',
                                                                                       'BENEFICENTE' );


insert into cidade (
   nome,
   estado,
   qtdhab,
   areaterrit
) values ( 'SAO CARLOS',
           'SP',
           254000,
           1137.00 ),( 'IPATINGA',
                       'MG',
                       270000,
                       165.00 ),( 'FORTALEZA',
                                  'CE',
                                  2687000,
                                  314.93 ),( 'BRASILIA',
                                             'DF',
                                             3055000,
                                             5802.00 ),( 'JACAREI',
                                                         'SP',
                                                         242000,
                                                         464.27 ),( 'SAO PAULO',
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
) values ( '12345678000190',
           100,
           to_date('07/10/2004','DD/MM/YYYY'),
           'CAMPANHAS SOBRE CANCER DE MAMA' ),( '34567890000170',
                                                45,
                                                to_date('12/03/2005','DD/MM/YYYY'),
                                                'APOIO A FAMILIAS CARENTES E CAMPANHAS DE VACINACAO' ),( '45678901000160',
                                                                                                         80,
                                                                                                         to_date('25/08/2010'
                                                                                                         ,'DD/MM/YYYY'),
                                                                                                         'ACOES DE SAUDE COMUNITARIA E DOACAO DE SANGUE'
                                                                                                         );

insert into rede_de_saude (
   cnpj,
   qtdleitos,
   qtdfuncion
) values ( '12345678000190',
           250,
           500 ),( '23456789000180',
                   120,
                   200 );

insert into regiao (
   rede_de_saude,
   raio,
   densidpop,
   nomecidade,
   estadocidade
) values ( '12345678000190',
           15.0,
           223.5,
           'SAO CARLOS',
           'SP' ),( '23456789000180',
                    30.0,
                    526.7,
                    'BRASILIA',
                    'DF' );


insert into programa (
   beneficente,
   programa
) values ( '12345678000190',
           'OUTUBRO ROSA – CONSCIENTIZACAO SOBRE CANCER DE MAMA' ),( '12345678000190',
                                                                     'MUTIRAO DE EXAMES PREVENTIVOS' ),( '34567890000170',
                                                                                                         'CAMPANHA DE VACINACAO INFANTIL'
                                                                                                         ),( '34567890000170'
                                                                                                         ,
                                                                                                                                          'DISTRIBUICAO DE CESTAS BASICAS'
                                                                                                                                          )
                                                                                                                                          ,
                                                                                                                                          (
                                                                                                                                          '45678901000160'
                                                                                                                                          ,
                                                                                                                                                                           'CAMPANHA DE DOACAO DE SANGUE'
                                                                                                                                                                           )
                                                                                                                                                                           ,
                                                                                                                                                                           (
                                                                                                                                                                           '45678901000160'
                                                                                                                                                                           ,
                                                                                                                                                                                                          'FEIRA DE SAUDE E PREVENCAO DE DOENCAS'
                                                                                                                                                                                                          )
                                                                                                                                                                                                          ,
                                                                                                                                                                                                          (
                                                                                                                                                                                                          '45678901000160'
                                                                                                                                                                                                          ,
                                                                                                                                                                                                                                                  'ATENDIMENTO MEDICO GRATUITO EM COMUNIDADES CARENTES'
                                                                                                                                                                                                                                                  )
                                                                                                                                                                                                                                                  ;

insert into especialidades (
   rede_de_saude,
   especialidade
) values ( '12345678000190',
           'CLINICA GERAL' ),( '12345678000190',
                               'PEDIATRIA' ),( '12345678000190',
                                               'INFECTOLOGIA' ),( '12345678000190',
                                                                  'CARDIOLOGIA' ),( '23456789000180',
                                                                                    'ORTOPEDIA' ),( '23456789000180',
                                                                                                    'GINECOLOGIA' ),( '23456789000180'
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
           '12345678000190',
           'SARS-COV-2',
           to_date('05/02/25','DD/MM/YY'),
           to_date('20/02/25','DD/MM/YY'),
           'PREVENCAO',
           'CAMPANHA DE CONSCIENTIZACAO SOBRE A IMPORTANCIA DO USO DE MASCARAS E VACINACAO CONTRA A COVID-19.',
           'REDES SOCIAIS',
           'ALTA' ),( 2,
                      '34567890000170',
                      'DENV',
                      to_date('10/01/25','DD/MM/YY'),
                      to_date('31/03/25','DD/MM/YY'),
                      'CONTROLE VETORIAL',
                      'MUTIRAO DE COMBATE AO MOSQUITO AEDES AEGYPTI EM BAIRROS DE MAIOR INCIDENCIA DE DENGUE.',
                      'RADIO COMUNITARIA',
                      'ALTA' ),( 3,
                                 '45678901000160',
                                 'MYCOBACTERIUM TUBERCULOSIS',
                                 to_date('15/03/25','DD/MM/YY'),
                                 to_date('30/04/25','DD/MM/YY'),
                                 'CONSCIENTIZACAO',
                                 'CAMPANHA INFORMATIVA SOBRE SINTOMAS E TRATAMENTO DA TUBERCULOSE, COM FOCO EM DIAGNOSTICO PRECOCE.'
                                 ,
                                 'TELEVISAO LOCAL',
                                 'MEDIA' ),( 4,
                                             '34567890000170',
                                             'INFLUENZA VIRUS A',
                                             to_date('01/05/25','DD/MM/YY'),
                                             to_date('30/06/25','DD/MM/YY'),
                                             'VACINACAO',
                                             'CAMPANHA DE VACINACAO CONTRA A GRIPE PARA GRUPOS DE RISCO.',
                                             'POSTOS DE SAUDE',
                                             'ALTA' ),( 5,
                                                        '45678901000160',
                                                        'SARS-COV-2',
                                                        to_date('10/07/25','DD/MM/YY'),
                                                        null,
                                                        'ACOMPANHAMENTO',
                                                        'MONITORAMENTO DE NOVOS CASOS DE COVID-19 E REFORCO DA VACINACAO DE REFORCO.'
                                                        ,
                                                        'APLICATIVO DE SAUDE',
                                                        'MEDIA' );


insert into abrange (
   idalerta,
   rede_de_saude
) values ( 1,
           '12345678000190' ),( 1,
                                '23456789000180' ),( 2,
                                                     '12345678000190' ),( 3,
                                                                          '23456789000180' ),( 3,
                                                                                               '44.256.789/0001-20' ),( 4,
                                                                                                                        '44.256.789/0001-20'
                                                                                                                        ),( 4
                                                                                                                        ,
                                                                                                                                             '12345678000190'
                                                                                                                                             )
                                                                                                                                             ,
                                                                                                                                             (
                                                                                                                                             5
                                                                                                                                             ,
                                                                                                                                                              '12345678000190'
                                                                                                                                                              )
                                                                                                                                                              ,
                                                                                                                                                              (
                                                                                                                                                              5
                                                                                                                                                              ,
                                                                                                                                                                               '23456789000180'
                                                                                                                                                                               )
                                                                                                                                                                               ;