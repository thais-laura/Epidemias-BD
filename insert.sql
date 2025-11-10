INSERT INTO transmite (doenca, transmissor) VALUES
('Plasmodium falciparum', 'Mosquito Anopheles'),
('Mycobacterium tuberculosis', 'Pessoa Infectada'),
('Influenza virus A', 'Ar'),
('SARS-CoV-2', 'Ar');

INSERT INTO transmissor (nome, vetor, tipo, estacaoanopred, nomecientif, tempovida, regiaovivencia) VALUES
('Mosquito Anopheles', 'Mosquito', 'biótico', NULL, 'Anopheles darlingi', 30, 'Regiões tropicais e úmidas'),
('Ar', 'Gotículas de ar', 'abiótico', 'Inverno', NULL, NULL, 'Ambientes fechados e frios'),
('Contato Direto', 'Contato físico', 'abiótico', 'Todas', NULL, NULL, 'Ambientes urbanos'),
('Pessoa Infectada', 'Humano', 'biótico', NULL, 'Homo sapiens', 70, 'Mundo todo');

INSERT INTO doenca (nomecientif, nomepopular, letalidade, sazonalidade, cid10) VALUES
('Plasmodium falciparum', 'Malária', 0.2, 'Verão', 'B50'),
('Mycobacterium tuberculosis', 'Tuberculose', 0.15, 'Inverno', 'A15'),
('Influenza virus A', 'Gripe', 0.01, 'Outono', 'J10'),
('SARS-CoV-2', 'COVID-19', 0.03, 'Inverno', 'U07.1');
-- não coloquei tempo médio pq seria calculado com base nos casos

INSERT INTO sintomas (nomecientif, sintoma) VALUES
('Plasmodium falciparum', 'Febre alta'),
('Plasmodium falciparum', 'Calafrios e suor excessivo'),
('Mycobacterium tuberculosis', 'Tosse persistente com catarro'),
('Mycobacterium tuberculosis', 'Perda de peso e fadiga'),
('Influenza virus A', 'Febre e dor de cabeça'),
('Influenza virus A', 'Congestão nasal e dor muscular'),
('SARS-CoV-2', 'Febre e perda de olfato'),
('SARS-CoV-2', 'Tosse seca e dificuldade para respirar');

INSERT INTO agente (nomecientif, agente) VALUES
('Plasmodium falciparum', 'Protozoário'),
('Mycobacterium tuberculosis', 'Bactéria'),
('Influenza virus A', 'Vírus'),
('SARS-CoV-2', 'Vírus');

INSERT INTO metodoprevencao (nomecientif, metodoprevencao) VALUES
('Plasmodium falciparum', 'Uso de mosquiteiros'),
('Plasmodium falciparum', 'Repelentes'),
('Mycobacterium tuberculosis', 'Vacinação BCG'),
('Influenza virus A', 'Vacinação anual'),
('Influenza virus A', 'Higiene das mãos'),
('SARS-CoV-2', 'Uso de máscaras'),
('SARS-CoV-2', 'Isolamento em casos suspeitos');

INSERT INTO requer (doenca, tratamento) VALUES
('Plasmodium falciparum', 'Tratamento da Malária'),
('Mycobacterium tuberculosis', 'Tratamento da Tuberculose'),
('Influenza virus A', 'Tratamento da Gripe'),
('SARS-CoV-2', 'Tratamento da COVID-19'),
('SARS-CoV-2', 'Hemodiálise');

INSERT INTO tratamento (nome, tipo, remedio, customedio, duracaomedia, isolamento, maquina) VALUES
('Tratamento da Malária', 'Medicamento', 'Artemisinina', 150.00, 14, 'não', 'nenhuma'),
('Tratamento da Tuberculose', 'Medicamento', 'Rifampicina', 300.00, 180, 'não', 'nenhuma'),
('Tratamento da Gripe', 'Medicamento de suporte', 'Oseltamivir', 80.00, 7, 'não', 'nenhuma'),
('Tratamento da COVID-19', 'Suporte Intensivo', 'Antivirais e corticoides', 500.00, 14, 'sim', 'Respirador'),
('Quimioterapia', 'Oncológico', 'Cisplatina', 5000.00, 120, 'não', 'Bomba de infusão'),
('Hemodiálise', 'Suporte Renal', 'Nenhum', 800.00, 1, 'não', 'Máquina de hemodiálise');

insert into sessao (idsessao, idcaso, tratamento, data, hora, rede_de_saude, obsmedicas, resultadoesperado) values ();
insert into caso (idcaso, paciente, doenca, datainicio, datafim, gravidade, rede_de_saude, obito, reincidente) values ();
insert into metricas_sessoes (sessao, metrica, valor) values ();

INSERT INTO paciente (idpaciente, cpf, datanascim, sexo, gruporisco) VALUES
(1, '12345678901', TO_DATE('12/03/1985', 'DD/MM/YYYY'), 'F', 'sim'),
(2, '98765432100', TO_DATE('25/07/1992', 'DD/MM/YYYY'), 'M', 'não'),
(3, '45678912345', TO_DATE('03/11/1970', 'DD/MM/YYYY'), 'M', 'sim'),
(4, '32165498700', TO_DATE('14/05/2001', 'DD/MM/YYYY'), 'F', 'não'),
(5, '74185296300', TO_DATE('09/09/1958', 'DD/MM/YYYY'), 'M', 'sim'),
(6, '85296374100', TO_DATE('20/12/1989', 'DD/MM/YYYY'), 'F', 'não'),
(7, '36925814700', TO_DATE('17/02/2003', 'DD/MM/YYYY'), 'F', 'não'),
(8, '15975348600', TO_DATE('28/10/1976', 'DD/MM/YYYY'), 'M', 'sim'),
(9, '25814736900', TO_DATE('05/06/1999', 'DD/MM/YYYY'), 'F', 'não'),
(10, '96385274100', TO_DATE('01/01/1960', 'DD/MM/YYYY'), 'M', 'sim');

insert into tipo (orgao, tipo) values ();
insert into vacinas (idpaciente, vacina) values ();
insert into orgao (cnpj, nome, cep, bairro, logradouro, nro, telefone1, telefone2) values ();

INSERT INTO cidade (nome, estado, qtdhab, areaterrit) VALUES
('São Carlos', 'SP', 254000, 1137.00),
('Ipatinga', 'MG', 270000, 165.00),
('Fortaleza', 'CE', 2687000, 314.93),
('Brasília', 'DF', 3055000, 5802.00),
('Jacareí', 'SP', 242000, 464.27),
('São Paulo', 'SP', 12300000, 1521.11),
('Rio de Janeiro', 'RJ', 6775000, 1200.27),
('Belo Horizonte', 'MG', 2533000, 331.40),
('Curitiba', 'PR', 1964000, 434.89),
('Porto Alegre', 'RS', 1493000, 497.00),
('Recife', 'PE', 1653000, 218.84);


insert into beneficente (cnpj, qtdvolunt, datafundacao, areaatuacao) values ();
insert into rede_de_saude (cnpj, qtdleitos, qtdfuncion) values ();
insert into regiao (rede_de_saude, raio, densidpop, nomecidade, estadocidade) values ();
insert into programa (beneficente, programa) values ();
insert into especialidades (rede_de_saude, especialidade) values ();
insert into alerta (idalerta, beneficente, doenca, datainicio, datafim, tipo, mensagem, canalprinc, prioridade) values ();
insert into abrange (idalerta, regiao) values ();