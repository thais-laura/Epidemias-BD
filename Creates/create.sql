CREATE TABLE cidade (
    nome        VARCHAR2(50) NOT NULL,
    estado      CHAR(2) NOT NULL,
    qtdhab      NUMBER,
    areaterrit  NUMBER(10,2),

    -- chave primaria composta
    CONSTRAINT pk_cidade PRIMARY KEY (nome, estado),

    -- restricoes 
    CONSTRAINT chk_estado_uf
        CHECK (REGEXP_LIKE(estado, '^[A-Z]{2}$')), -- estado deve ter 2 letras

    CONSTRAINT chk_qtdhab_nao_negativa
        CHECK (qtdhab >= 0),

    CONSTRAINT chk_areaterrit_nao_negativa
        CHECK (areaterrit >= 0)
);

CREATE TABLE paciente (
    idpaciente   NUMBER PRIMARY KEY,
    cpf          VARCHAR2(11) UNIQUE NOT NULL,
    datanascim   DATE,
    sexo         CHAR(1),
    gruporisco   CHAR(1),
    
    -- restricoes
    -- sexo deve ser M ou F
    CONSTRAINT chk_paciente_sexo
        CHECK (sexo IN ('M', 'F')),

    -- grupo de risco deve ser 'sim' ou 'não'
    CONSTRAINT chk_paciente_gruporisco
        CHECK (gruporisco IN ('S', 'N')),

    -- CPF precisa ter exatamente 11 digitos numericos
    CONSTRAINT chk_paciente_cpf
        CHECK (REGEXP_LIKE(cpf, '^[0-9]{11}$'))

);

CREATE TABLE vacinas (
    idpaciente  NUMBER NOT NULL,
    vacina      VARCHAR2(60) NOT NULL,

    -- chave primaria composta
    CONSTRAINT pk_vacinas PRIMARY KEY (idpaciente, vacina),

    -- chave estrangeira
    CONSTRAINT fk_vacinas_paciente
        FOREIGN KEY (idpaciente)
        REFERENCES paciente (idpaciente)
        ON DELETE CASCADE,
    
    -- restricao
    -- vacina nao pode ser string vazia
    CONSTRAINT chk_vacinas_nome
        CHECK (vacina IS NOT NULL AND vacina <> '')
);

CREATE TABLE doenca (
    nomecientif     VARCHAR2(60) NOT NULL,
    nomepopular   VARCHAR2(60) NOT NULL,
    letalidade    NUMBER(4,2),
    sazonalidade  VARCHAR2(20),
    cid10         VARCHAR2(10),
    tempomedio      NUMBER(10,2),

    -- chave primaria
    CONSTRAINT pk_doenca PRIMARY KEY (nomecientif),

    -- restricoes
    -- letalidade entre 0 e 1
    CONSTRAINT chk_doenca_letalidade
        CHECK (letalidade >= 0 AND letalidade <= 1),

    -- sazonalidade deve ser uma das estacoes
    CONSTRAINT chk_doenca_sazonalidade
        CHECK (sazonalidade IN ('VERAO', 'OUTONO', 'INVERNO', 'PRIMAVERA', 'TODAS')),

    -- CID-10 no formato (letra + numeros + opcional ponto)
    CONSTRAINT chk_doenca_cid10
        CHECK (REGEXP_LIKE(cid10, '^[A-Z][0-9]{2}(\.[0-9])?$'))
);

CREATE TABLE sintomas (
    nomecientif   VARCHAR2(60) NOT NULL,
    sintoma     VARCHAR2(80) NOT NULL,

    -- chave primaria composta
    CONSTRAINT pk_sintomas PRIMARY KEY (nomecientif, sintoma),

    -- chave estrangeira
    CONSTRAINT fk_sintomas_doenca
        FOREIGN KEY (nomecientif)
        REFERENCES doenca (nomecientif)
        ON DELETE CASCADE
);

CREATE TABLE agente (
    nomecientif   VARCHAR2(60) NOT NULL,
    agente      VARCHAR2(60) NOT NULL,

    -- chave primaria composta
    CONSTRAINT pk_agente PRIMARY KEY (nomecientif, agente),

    -- chave estrangeira
    CONSTRAINT fk_agente_doenca
        FOREIGN KEY (nomecientif)
        REFERENCES doenca (nomecientif)
        ON DELETE CASCADE
);

CREATE TABLE metodoprevencao (
    nomecientif        VARCHAR2(60) NOT NULL,
    metodoprevencao  VARCHAR2(60) NOT NULL,

    -- chave primaria composta
    CONSTRAINT pk_metodoprevencao PRIMARY KEY (nomecientif, metodoprevencao),

    -- chave estrangeira
    CONSTRAINT fk_metodoprevencao_doenca
        FOREIGN KEY (nomecientif)
        REFERENCES doenca (nomecientif)
        ON DELETE CASCADE
);

CREATE TABLE tratamento (
    nome          VARCHAR2(50) NOT NULL,  
    tipo          VARCHAR2(40)  ,  
    remedio       VARCHAR2(60) ,  
    customedio    NUMBER(10,2)  ,  
    duracaomedia  NUMBER        ,  
    isolamento    CHAR(1)   ,  
    maquina       VARCHAR2(60) ,  

    -- chave primaria
    CONSTRAINT pk_tratamento 
        PRIMARY KEY (nome),

    -- restricoes
    -- custo medio nao pode ser negativo
    CONSTRAINT chk_tratamento_custo 
        CHECK (custoMedio >= 0),

    -- duracao media deve ser positiva
    CONSTRAINT chk_tratamento_duracao 
        CHECK (duracaoMedia > 0),

    -- isolamento limitado a 'sim' ou 'não'
    CONSTRAINT chk_tratamento_isolamento
        CHECK (isolamento IN ('S', 'N'))
);

CREATE TABLE requer (
  doenca      VARCHAR2(60)  NOT NULL,  
  tratamento  VARCHAR2(50)  NOT NULL,  

    -- chave primaria composta
    CONSTRAINT pk_requer PRIMARY KEY (doenca, tratamento),

    -- chaves estrangeiras
    CONSTRAINT fk_requer_doenca
        FOREIGN KEY (doenca) REFERENCES doenca (nomecientif) 
        on delete cascade,
    CONSTRAINT fk_requer_tratamento
    FOREIGN KEY (tratamento) REFERENCES tratamento (nome) 
        on delete cascade
);

CREATE TABLE transmissor(
    nome                VARCHAR2(50) NOT NULL,
    vetor               VARCHAR2(40),
    tipo                CHAR(8) NOT NULL,
    estacaoanopredom    VARCHAR2(10),
    nomecientif         VARCHAR2(50),
    tempovida           VARCHAR2(15),
    regiaovivencia      VARCHAR2(50),

    --chave primaria
    CONSTRAINT pk_transmissor PRIMARY KEY(nome),

    --chave secundaria
    CONSTRAINT sk_transmissor UNIQUE(nomecientif),

    --restricoes
    CONSTRAINT ck_tipo_transmissor CHECK (TIPO IN ('BIOTICO','ABIOTICO')),
    CONSTRAINT ck_nomecientif CHECK (((tipo = 'ABIOTICO') and (nomecientif is null)) OR ((tipo = 'BIOTICO' AND NOMECIENTIF IS NOT NULL))),
    constraint ck_regiaovivencia CHECK (((tipo = 'ABIOTICO') and (regiaovivencia is null)) OR (((tipo = 'BIOTICO') AND (regiaovivencia IS NOT NULL)))),
    CONSTRAINT ck_estacaoanopredom CHECK (
        (tipo = 'ABIOTICO' AND estacaoAnoPredom IN ('PRIMAVERA','VERAO','OUTONO','INVERNO','TODAS'))
    OR (tipo = 'BIOTICO' AND estacaoAnoPredom IS NULL)),
    CONSTRAINT ck_tempovida CHECK (REGEXP_LIKE(tempovida,'^\d+\s[A-Za-z]+$'))
);

CREATE TABLE orgao(
    cnpj            CHAR(14) NOT NULL,
    nome            VARCHAR2(80),
    cep             CHAR(8),
    bairro          VARCHAR2(60),
    logradouro      VARCHAR2(60),
    numero          VARCHAR2(5),
    telefone1       VARCHAR2(11),
    telefone2       VARCHAR2(11),

    --chave primaria
    CONSTRAINT pk_orgao PRIMARY KEY(cnpj),

    --restricoes
    CONSTRAINT ck_cnpj CHECK(REGEXP_LIKE(cnpj,'^\d+$')),
    CONSTRAINT ck_cep CHECK(REGEXP_LIKE(cep,'^\d+$')),
    CONSTRAINT ck_telefone1 CHECK(REGEXP_LIKE(telefone1,'^\d+$')),
    CONSTRAINT ck_telefone2 CHECK(REGEXP_LIKE(telefone1,'^\d+$'))
);

CREATE TABLE tipo_orgao(
    orgao   CHAR(14) NOT NULL,
    tipo    VARCHAR2(13) NOT NULL,

    --chave primaria composta
    CONSTRAINT pk_tipo_orgao PRIMARY KEY(orgao,tipo),

    --chave estrangeira
    CONSTRAINT fk_tipo_orgao
        FOREIGN KEY (orgao)
        REFERENCES orgao (cnpj)
        ON DELETE CASCADE,

    --restricao
    CONSTRAINT ck_tipo_orgao_tipo CHECK((tipo) IN ('BENEFICENTE','REDE DE SAUDE'))
);

CREATE TABLE beneficente(
    cnpj            CHAR(14) NOT NULL,
    qtdvolunt       NUMBER,
    datafundacao    DATE,
    areaatuacao     VARCHAR2(60),

    --chave primaria
    CONSTRAINT pk_beneficente PRIMARY KEY (cnpj),

    --chave estrangeira
    CONSTRAINT fk_beneficente
        FOREIGN KEY (cnpj)
        REFERENCES orgao (cnpj)
        ON DELETE CASCADE

);

CREATE TABLE programas(
    beneficente CHAR(14) NOT NULL,
    programa    VARCHAR2(70) NOT NULL,

    --chave primaria composta
    CONSTRAINT pk_programas PRIMARY KEY (beneficente,programa),

    --chave estrangeira
    CONSTRAINT fk_promagas
        FOREIGN KEY (beneficente)
        REFERENCES beneficente (cnpj)
        ON DELETE CASCADE
);

CREATE TABLE rede_de_saude(
    cnpj        CHAR(14) NOT NULL,
    qtdleitos   NUMBER,
    qtdfuncion   NUMBER,

    --chave primaria
    CONSTRAINT pk_rede_de_saude PRIMARY KEY (cnpj),

    --chave estrangeira
    CONSTRAINT fk_rede_de_saude
        FOREIGN KEY (cnpj)
        REFERENCES orgao (cnpj)
        ON DELETE CASCADE
);

CREATE TABLE especialidades(
    rede_de_saude CHAR(14) NOT NULL,
    especialidade    VARCHAR2(40) NOT NULL,

    --chave primaria composta
    CONSTRAINT pk_especialidades PRIMARY KEY (rede_de_saude,especialidade),

    --chave estrangeira
    CONSTRAINT fk_especialidades
        FOREIGN KEY (rede_de_saude)
        REFERENCES rede_de_saude (cnpj)
        ON DELETE CASCADE
);

CREATE TABLE regiao (
    rede_de_saude   CHAR(14) NOT NULL,   
    raio            NUMBER,         
    densidpop       NUMBER,         
    nomecidade      VARCHAR2(50) NOT NULL,  
    estadocidade    CHAR(2) NOT NULL,        

    -- chave primaria
    CONSTRAINT pk_regiao 
        PRIMARY KEY (rede_de_saude),

    -- chaves estrangeiras
    CONSTRAINT fk_regiao_rede
        FOREIGN KEY (rede_de_saude)
        REFERENCES rede_de_saude (cnpj)
        ON DELETE CASCADE,

    CONSTRAINT fk_regiao_cidade
        FOREIGN KEY (nomecidade, estadocidade)
        REFERENCES cidade (nome, estado)
        on delete cascade, 

    -- restricoes
    -- raio deve ser positivo
    CONSTRAINT chk_regiao_raio
        CHECK ((raio is not null and raio > 0) or raio is null),

    -- densidade populacional nao pode ser negativa
    CONSTRAINT chk_regiao_densidade
        CHECK ((densidpop is not null and densidpop >= 0) or densidpop is null)
);


CREATE TABLE transmite (
    doenca        VARCHAR2(60)  NOT NULL, 
    transmissor   VARCHAR2(50)  NOT NULL, 
    
    CONSTRAINT pk_transmite PRIMARY KEY (doenca, transmissor),
    
    CONSTRAINT fk_transmite_doenca
        FOREIGN KEY (doenca) REFERENCES doenca (nomecientif) 
        on delete cascade,
    CONSTRAINT fk_transmite_transmissor
        FOREIGN KEY (transmissor) REFERENCES transmissor (nome) 
        on delete cascade
);


CREATE TABLE alerta (
  idalerta        NUMBER         NOT NULL,
  beneficente     CHAR(14)       NOT NULL,   
  doenca          VARCHAR2(60)  NOT NULL,   
  datainicio      DATE           NOT NULL,
  datafim         DATE,
  tipo            VARCHAR2(30),
  mensagem        VARCHAR2(400),
  canalprincipal  VARCHAR2(50),
  prioridade      VARCHAR2(10),

    -- chave primaria
    CONSTRAINT pk_alerta PRIMARY KEY (idalerta),
    
    -- chave secundária
    CONSTRAINT uq_alerta_bdf UNIQUE (beneficente, doenca, datainicio),

    -- chaves estrangeiras
    CONSTRAINT fk_alerta_beneficente
        FOREIGN KEY (beneficente) REFERENCES beneficente (cnpj) 
        on delete cascade,
    CONSTRAINT fk_alerta_doenca
        FOREIGN KEY (doenca)      REFERENCES doenca (nomecientif) 
        on delete cascade,

    -- restricao
    CONSTRAINT ck_alerta_datas
        CHECK (datafim IS NULL OR datafim >= datainicio)
);

CREATE TABLE abrange (
    regiao_rede_de_saude  CHAR(14) NOT NULL,  
    idalerta              NUMBER       NOT NULL,  

    -- chave primaria
    CONSTRAINT pk_abrange PRIMARY KEY (regiao_rede_de_saude, idalerta),

    -- chaves estrangeiras
    CONSTRAINT fk_abrange_regiao
        FOREIGN KEY (regiao_rede_de_saude) REFERENCES regiao (rede_de_saude) 
        on delete cascade,
    CONSTRAINT fk_abrange_alerta
        FOREIGN KEY (idalerta)             REFERENCES alerta (idalerta) 
        on delete cascade
);

CREATE TABLE caso (
    idcaso      NUMBER         NOT NULL,
    paciente    NUMBER         NOT NULL,       
    doenca      VARCHAR2(60)  NOT NULL,       
    datainicio  DATE           NOT NULL,
    datafim     DATE,
    gravidade   VARCHAR2(20),
    obito       CHAR(1),                       
    REDE_DE_SAUDE        CHAR(14)      NOT NULL,        
    reincidente char(1),

    -- chave primaria
    CONSTRAINT pk_caso PRIMARY KEY (idcaso),
    
    -- chave secundária
    CONSTRAINT uq_caso_ep UNIQUE (paciente, doenca, datainicio),

    -- chaves estrangeiras
    CONSTRAINT fk_caso_paciente
        FOREIGN KEY (paciente) REFERENCES paciente (idpaciente) 
        on delete cascade,
    CONSTRAINT fk_caso_doenca
        FOREIGN KEY (doenca)   REFERENCES doenca (nomecientif) 
        on delete cascade,
    CONSTRAINT fk_caso_orgao
        FOREIGN KEY (REDE_DE_SAUDE)     REFERENCES REDE_DE_SAUDE (cnpj) 
        on delete cascade,

    -- restricoes
    CONSTRAINT ck_caso_datas
        CHECK (datafim IS NULL OR datafim >= datainicio),
    
    CONSTRAINT ck_caso_obito
        CHECK (obito IN ('S','N') OR obito IS NULL),
    
    CONSTRAINT CK_CASO_REINCIDENTE 
        CHECK (REINCIDENTE IN ('S','N'))
);


CREATE TABLE sessao(
    idsessao            NUMBER NOT NULL,
    idcaso              NUMBER NOT NULL,
    tratamento          VARCHAR2(50) NOT NULL, 
    rede_de_saude       CHAR(14) NOT NULL,
    datahora            DATE,
    obsmedicas          VARCHAR2(150),
    resultadoesperado   VARCHAR2(150),
    
    --chave primaria
    CONSTRAINT pk_idsessao PRIMARY KEY (idsessao),
    
    --chave secundaria
    CONSTRAINT sk_idsessao UNIQUE(idcaso,tratamento,datahora),
    
    --chaves estrangeiras
    CONSTRAINT fk_sessao_idcaso
        FOREIGN KEY (idcaso)
        REFERENCES caso (idcaso)
        ON DELETE CASCADE,
    
    CONSTRAINT fk_sessao_tratamento
        FOREIGN KEY (tratamento)
        REFERENCES tratamento (nome)
        ON DELETE CASCADE,
    
    CONSTRAINT fk_sessao_rede_de_saude
        FOREIGN KEY (rede_de_saude)
        REFERENCES rede_de_saude (cnpj)
        ON DELETE CASCADE
);

CREATE TABLE metricas_sessoes(
    sessao      NUMBER NOT NULL,
    metrica     VARCHAR2(40) NOT NULL,
    valor       VARCHAR2(30),
    
    --chave primaria composta
    CONSTRAINT pk_metricas_sessoes PRIMARY KEY (sessao,metrica),
    
    --chave estrangeira
    CONSTRAINT fk_metricas_sessoes
        FOREIGN KEY (sessao)
        REFERENCES sessao (idsessao)
        ON DELETE CASCADE
);

commit;
