CREATE TABLE cidade (
    nome        VARCHAR2(100) NOT NULL,
    estado      CHAR(2) NOT NULL,
    qtdhab      NUMBER NOT NULL,
    areaTerrit  NUMBER(10,2) NOT NULL,

    -- chave primaria composta
    CONSTRAINT pk_cidade PRIMARY KEY (nome, estado),

    -- restricoes 
    CONSTRAINT chk_estado_uf
        CHECK (REGEXP_LIKE(estado, '^[A-Z]{2}$')), -- estado deve ter 2 letras

    CONSTRAINT chk_qtdhab_nao_negativa
        CHECK (qtdhab >= 0),

    CONSTRAINT chk_areaterrit_nao_negativa
        CHECK (areaTerrit >= 0)
);

CREATE TABLE paciente (
    idpaciente   NUMBER PRIMARY KEY,
    cpf          VARCHAR2(11) UNIQUE NOT NULL,
    datanascim   DATE NOT NULL,
    sexo         CHAR(1) NOT NULL,
    gruporisco   VARCHAR2(3) NOT NULL,

    -- sexo deve ser M ou F
    CONSTRAINT chk_paciente_sexo
        CHECK (sexo IN ('M', 'F')),

    -- grupo de risco deve ser 'sim' ou 'não'
    CONSTRAINT chk_paciente_gruporisco
        CHECK (gruporisco IN ('sim', 'não')),

    -- CPF precisa ter exatamente 11 digitos numericos
    CONSTRAINT chk_paciente_cpf
        CHECK (REGEXP_LIKE(cpf, '^[0-9]{11}$'))

);

CREATE TABLE vacinas (
    idpaciente  NUMBER NOT NULL,
    vacina      VARCHAR2(100) NOT NULL,

    -- chave primaria composta
    CONSTRAINT pk_vacinas PRIMARY KEY (idpaciente, vacina),

    -- FK 
    CONSTRAINT fk_vacinas_paciente
        FOREIGN KEY (idpaciente)
        REFERENCES paciente (idpaciente)
        ON DELETE CASCADE,

    -- vacina nao pode ser string vazia
    CONSTRAINT chk_vacinas_nome
        CHECK (vacina IS NOT NULL AND vacina <> '')
);

CREATE TABLE doenca (
    nomecientif     VARCHAR2(120) NOT NULL,
    nomepopular   VARCHAR2(120) NOT NULL,
    letalidade    NUMBER(4,2)   NOT NULL,
    sazonalidade  VARCHAR2(20)  NOT NULL,
    cid10         VARCHAR2(10)  NOT NULL,

    -- chave primaria
    CONSTRAINT pk_doenca PRIMARY KEY (nomecientif),

    -- letalidade entre 0 e 1
    CONSTRAINT chk_doenca_letalidade
        CHECK (letalidade >= 0 AND letalidade <= 1),

    -- sazonalidade deve ser uma das estacoes
    CONSTRAINT chk_doenca_sazonalidade
        CHECK (sazonalidade IN ('Verão', 'Outono', 'Inverno', 'Primavera')),

    -- CID-10 no formato (letra + numeros + opcional ponto)
    CONSTRAINT chk_doenca_cid10
        CHECK (REGEXP_LIKE(cid10, '^[A-Z][0-9]{2}(\.[0-9])?$'))
);

CREATE TABLE sintomas (
    nomecientif   VARCHAR2(120) NOT NULL,
    sintoma     VARCHAR2(200) NOT NULL,

    -- chave primaria composta
    CONSTRAINT pk_sintomas PRIMARY KEY (nomecientif, sintoma),

    -- FK 
    CONSTRAINT fk_sintomas_doenca
        FOREIGN KEY (nomecientif)
        REFERENCES doenca (nomecientif)
        ON DELETE CASCADE,

    -- sintoma nao pode ser vazio
    CONSTRAINT chk_sintomas_nome
        CHECK (sintoma IS NOT NULL AND sintoma <> '')
);

CREATE TABLE agente (
    nomecientif   VARCHAR2(120) NOT NULL,
    agente      VARCHAR2(200) NOT NULL,

    -- chave primaria composta
    CONSTRAINT pk_agente PRIMARY KEY (nomecientif, agente),

    -- FK 
    CONSTRAINT fk_agente_doenca
        FOREIGN KEY (nomecientif)
        REFERENCES doenca (nomecientif)
        ON DELETE CASCADE,

    -- agente nao pode ser vazio
    CONSTRAINT chk_agente_nome
        CHECK (agente IS NOT NULL AND agente <> '')
);

CREATE TABLE metodoprevencao (
    nomecientif        VARCHAR2(120) NOT NULL,
    metodoprevencao  VARCHAR2(200) NOT NULL,

    -- chave primaria composta
    CONSTRAINT pk_metodoprevencao PRIMARY KEY (nomecientif, metodoprevencao),

    -- FK
    CONSTRAINT fk_metodoprevencao_doenca
        FOREIGN KEY (nomecientif)
        REFERENCES doenca (nomecientif)
        ON DELETE CASCADE,

    -- metodo prevencao nao pode ser vazio
    CONSTRAINT chk_metodoprevencao_nome
        CHECK (metodoprevencao IS NOT NULL AND metodoprevencao <> '')
);

CREATE TABLE tratamento (
    nome          VARCHAR2(150) NOT NULL,  
    tipo          VARCHAR2(50)  NOT NULL,  
    remedio       VARCHAR2(120) NOT NULL,  
    customedio    NUMBER(10,2)  NOT NULL,  
    duracaomedia  NUMBER        NOT NULL,  
    isolamento    VARCHAR2(3)   NOT NULL,  
    maquina       VARCHAR2(120) NOT NULL,  

    -- chave primaria
    CONSTRAINT pk_tratamento 
        PRIMARY KEY (nome),

    -- custo medio nao pode ser negativo
    CONSTRAINT chk_tratamento_custo 
        CHECK (custoMedio >= 0),

    -- duracao media deve ser positiva
    CONSTRAINT chk_tratamento_duracao 
        CHECK (duracaoMedia > 0),

    -- isolamento limitado a 'sim' ou 'não'
    CONSTRAINT chk_tratamento_isolamento
        CHECK (isolamento IN ('sim', 'não'))
);

CREATE TABLE regiao (
    rede_de_saude   VARCHAR2(14) NOT NULL,   
    raio            NUMBER NOT NULL,         
    densidpop       NUMBER NOT NULL,         
    nomecidade      VARCHAR2(100) NOT NULL,  
    estadocidade    CHAR(2) NOT NULL,        

    -- chave primaria
    CONSTRAINT pk_regiao 
        PRIMARY KEY (rede_de_saude),

    -- FK 
    CONSTRAINT fk_regiao_rede
        FOREIGN KEY (rede_de_saude)
        REFERENCES rede_de_saude (cnpj)
        ON DELETE CASCADE,

    -- FK 
    CONSTRAINT fk_regiao_cidade
        FOREIGN KEY (nomecidade, estadocidade)
        REFERENCES cidade (nome, estado),

    -- raio deve ser positivo
    CONSTRAINT chk_regiao_raio
        CHECK (raio > 0),

    -- densidade populacional nao pode ser negativa
    CONSTRAINT chk_regiao_densidade
        CHECK (densidpop >= 0)
);
