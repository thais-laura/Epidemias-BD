INSERT INTO transmite (doenca, transmissor) VALUES ('MUMPS VIRUS', 'AR');
INSERT INTO transmite (doenca, transmissor) VALUES ('RUBELLA VIRUS', 'AR');
INSERT INTO transmite (doenca, transmissor) VALUES ('HEPATITIS A VIRUS', 'CONTATO DIRETO');
INSERT INTO transmite (doenca, transmissor) VALUES ('YELLOW FEVER VIRUS', 'MOSQUITO ANOPHELES');

INSERT INTO requer (doenca, tratamento) VALUES ('MUMPS VIRUS', 'SUPORTE CLINICO');
INSERT INTO requer (doenca, tratamento) VALUES ('HEPATITIS A VIRUS', 'HEMODIALISE');
INSERT INTO requer (doenca, tratamento) VALUES ('PLASMODIUM FALCIPARUM', 'HEMODIALISE');
INSERT INTO requer (doenca, tratamento) VALUES ('MEASLES VIRUS', 'CUIDADOS DE UTI PARA INFECCOES GRAVES');

INSERT INTO infecta VALUES (3, 'DENV');
INSERT INTO infecta VALUES (9, 'INFLUENZA VIRUS A');
INSERT INTO infecta VALUES (11, 'ZIKA VIRUS');
INSERT INTO infecta VALUES (15, 'CHIKUNGUNYA VIRUS');


INSERT INTO alerta (idalerta, beneficente, doenca, datainicio, datafim, tipo, mensagem, canalprincipal, prioridade)
VALUES (6, '34567890000170', 'RUBELLA VIRUS', DATE '2025-08-01', DATE '2025-08-30',
        'VACINACAO', 'REFORÇO DA CAMPANHA DE VACINAÇÃO CONTRA RUBÉOLA.', 'POSTOS DE SAUDE', 'MEDIA');

INSERT INTO alerta (idalerta, beneficente, doenca, datainicio, datafim, tipo, mensagem, canalprincipal, prioridade)
VALUES (7, '45678901000160', 'MEASLES VIRUS', DATE '2025-09-10', NULL,
        'CONSCIENTIZACAO', 'AUMENTO DE CASOS DE SARAMPO – ORIENTAÇÕES SOBRE SINTOMAS.', 'REDES SOCIAIS', 'ALTA');

INSERT INTO abrange (idalerta, regiao_rede_de_saude) VALUES (6, '12345678000190');
INSERT INTO abrange (idalerta, regiao_rede_de_saude) VALUES (6, '23423789120180');

INSERT INTO abrange (idalerta, regiao_rede_de_saude) VALUES (7, '23456789000180');
INSERT INTO abrange (idalerta, regiao_rede_de_saude) VALUES (7, '67967967967967');

INSERT INTO caso (idcaso, paciente, doenca, datainicio, datafim, gravidade, rede_de_saude, obito, reincidente)
VALUES (30, 9, 'MUMPS VIRUS', DATE '2025-01-12', DATE '2025-01-20', 'LEVE', '12345678000190', 'N', 'N');

INSERT INTO caso (idcaso, paciente, doenca, datainicio, datafim, gravidade, rede_de_saude, obito, reincidente)
VALUES (31, 11, 'RUBELLA VIRUS', DATE '2024-09-14', DATE '2024-09-28', 'MODERADO', '23456789000180', 'N', 'N');

INSERT INTO caso (idcaso, paciente, doenca, datainicio, datafim, gravidade, rede_de_saude, obito, reincidente)
VALUES (32, 15, 'VARICELLA ZOSTER VIRUS', DATE '2025-02-01', NULL, 'LEVE', '12345678000190', 'N', 'N');

INSERT INTO caso (idcaso, paciente, doenca, datainicio, datafim, gravidade, rede_de_saude, obito, reincidente)
VALUES (33, 20, 'LEPTOSPIRA INTERROGANS', DATE '2025-03-05', NULL, 'GRAVE', '23423789120180', 'N', 'N');


