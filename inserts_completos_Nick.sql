-- Inserts for tables
-- transmite
INSERT INTO transmite (doenca, transmissor) VALUES ('DENV', 'MOSQUITO ANOPHELES');
INSERT INTO transmite (doenca, transmissor) VALUES ('ZIKA VIRUS', 'MOSQUITO ANOPHELES');
INSERT INTO transmite (doenca, transmissor) VALUES ('CHIKUNGUNYA VIRUS', 'MOSQUITO ANOPHELES');
INSERT INTO transmite (doenca, transmissor) VALUES ('NEISSERIA MENINGITIDIS', 'AR');
INSERT INTO transmite (doenca, transmissor) VALUES ('MYCOBACTERIUM TUBERCULOSIS', 'AR');
INSERT INTO transmite (doenca, transmissor) VALUES ('INFLUENZA VIRUS A', 'CONTATO DIRETO');
INSERT INTO transmite (doenca, transmissor) VALUES ('SARS-COV-2', 'CONTATO DIRETO');
INSERT INTO transmite (doenca, transmissor) VALUES ('LEPTOSPIRA INTERROGANS', 'AR');
INSERT INTO transmite (doenca, transmissor) VALUES ('VARICELLA ZOSTER VIRUS', 'AR');
INSERT INTO transmite (doenca, transmissor) VALUES ('MEASLES VIRUS', 'AR');

-- requer
INSERT INTO requer (doenca, tratamento) VALUES ('INFLUENZA VIRUS A', 'TRATAMENTO DA GRIPE');
INSERT INTO requer (doenca, tratamento) VALUES ('DENV', 'TRATAMENTO DA CHIKUNGUNYA');
INSERT INTO requer (doenca, tratamento) VALUES ('ZIKA VIRUS', 'TRATAMENTO DA ZIKA');
INSERT INTO requer (doenca, tratamento) VALUES ('CHIKUNGUNYA VIRUS', 'TRATAMENTO DA CHIKUNGUNYA');
INSERT INTO requer (doenca, tratamento) VALUES ('NEISSERIA MENINGITIDIS', 'TRATAMENTO DA MENINGITE');
INSERT INTO requer (doenca, tratamento) VALUES ('VARICELLA ZOSTER VIRUS', 'TRATAMENTO DA CATAPORA');
INSERT INTO requer (doenca, tratamento) VALUES ('RUBELLA VIRUS', 'TRATAMENTO DA RUBEOLA');
INSERT INTO requer (doenca, tratamento) VALUES ('YELLOW FEVER VIRUS', 'TRATAMENTO DA FEBRE AMARELA');
INSERT INTO requer (doenca, tratamento) VALUES ('LEPTOSPIRA INTERROGANS', 'TRATAMENTO DA LEPTOSPIROSE');
INSERT INTO requer (doenca, tratamento) VALUES ('MEASLES VIRUS', 'ANTIVIRAL PARA SARAMPO');

-- infecta
INSERT INTO infecta VALUES (1, 'VARICELLA ZOSTER VIRUS');
INSERT INTO infecta VALUES (2, 'RUBELLA VIRUS');
INSERT INTO infecta VALUES (4, 'INFLUENZA VIRUS A');
INSERT INTO infecta VALUES (5, 'DENV');
INSERT INTO infecta VALUES (6, 'CHIKUNGUNYA VIRUS');
INSERT INTO infecta VALUES (8, 'ZIKA VIRUS');
INSERT INTO infecta VALUES (10, 'HEPATITIS A VIRUS');
INSERT INTO infecta VALUES (12, 'NEISSERIA MENINGITIDIS');
INSERT INTO infecta VALUES (14, 'MEASLES VIRUS');

-- alerta (IDs assumed sequential)
INSERT INTO alerta (beneficente, doenca, datainicio, datafim, tipo, mensagem, canalprincipal, prioridade)
VALUES ('12345678000190', 'DENV', DATE '2025-02-10', DATE '2025-03-10', 'PREVENCAO', 'AUMENTO DE CASOS DE DENGUE – ORIENTACAO SOBRE ELIMINACAO DE FOCOS.', 'REDES SOCIAIS', 'MEDIA');

INSERT INTO alerta (beneficente, doenca, datainicio, datafim, tipo, mensagem, canalprincipal, prioridade)
VALUES ('34567890000170', 'VARICELLA ZOSTER VIRUS', DATE '2025-04-01', DATE '2025-04-30', 'VACINACAO', 'REFORCO PARA VACINA DE CATAPORA EM CRIANCAS.', 'RADIO COMUNITARIA', 'BAIXA');

INSERT INTO alerta (beneficente, doenca, datainicio, datafim, tipo, mensagem, canalprincipal, prioridade)
VALUES ('45678901000160', 'LEPTOSPIRA INTERROGANS', DATE '2025-01-15', NULL, 'PREVENCAO', 'ALERTA SOBRE RISCO DE LEPTOSPIROSE EM AREAS ALAGADAS.', 'APLICATIVO DE SAUDE', 'ALTA');

-- abrange (IDs hypothetical 6, 7, 8)
INSERT INTO abrange VALUES ('12345678000190', 6);
INSERT INTO abrange VALUES ('23423789120180', 6);
INSERT INTO abrange VALUES ('23456789000180', 7);
INSERT INTO abrange VALUES ('12345678000190', 8);

-- caso
INSERT INTO caso (paciente, doenca, datainicio, datafim, gravidade, cnpj, obito)
VALUES (12, 'INFLUENZA VIRUS A', DATE '2025-03-01', DATE '2025-03-10', 'LEVE', '12345678000190', 'N');

INSERT INTO caso (paciente, doenca, datainicio, datafim, gravidade, cnpj, obito)
VALUES (14, 'DENV', DATE '2025-01-20', DATE '2025-02-05', 'MODERADO', '23456789000180', 'N');

INSERT INTO caso (paciente, doenca, datainicio, datafim, gravidade, cnpj, obito)
VALUES (19, 'SARS-COV-2', DATE '2025-04-12', NULL, 'LEVE', '23423789120180', 'N');

INSERT INTO caso (paciente, doenca, datainicio, datafim, gravidade, cnpj, obito)
VALUES (6, 'HEPATITIS A VIRUS', DATE '2024-11-01', DATE '2024-11-20', 'LEVE', '12345678000190', 'N');
