CREATE TABLE transmissor{
    nome                VARCHAR2(100) NOT NULL,
    vetor               VARCHAR2(40),
    tipo                CHAR(8) NOT NULL,
    estacaoanopredom    VARCHAR2(10),
    nomecientif         VARCHAR2(100) NOT NULL,
    tempovida           CHAR(5),
    regiaovivencia      VARCHAR2(100),

    --chave primaria
    CONSTRAINT pk_transmissor PRIMARY KEY(nome),

    --chave secundaria
    CONSTRAINT sk_transmissor UNIQUE(nomecientif),

    --restricoes
    CONSTRAINT ck_tipo CHECK (UPPER(TIPO) IN ('BIOTICO','ABIOTICO')),
    CONSTRAINT ck_estacaoanopredom CHECK (UPPER(estacaoanopredom) IN ('PRIMAVERA','VERAO','OUTONO','INVERNO')),
    CONSTRAINT ck_tempovida CHECK ((REGEXP_LIKE(UPPER(tempovida),'\d{2}\s\w+')) && (UPPER(SUBSTR(tempovida, -3,)) IN ('DIA','SEM','MES','ANO')))
}

CREATE TABLE orgao{
    cnpj            CHAR(18) NOT NULL,
    nome            VARCHAR2(100),
    cep             CHAR(9),
    bairro          VARCHAR2(100),
    logradouro      VARCHAR2(100),
    numero          VARCHAR2(10),
    telefone1       VARCHAR2(11),
    telefone2       VARCHAR2(11),

    --chave primaria
    CONSTRAINT pk_orgao PRIMARY KEY(cnpj),

    --restricoes
    CONSTRAINT ck_cnpj CHECK(REGEXP_LIKE(cnpj,'[A-Za-z0-9]{2}\.?[A-Za-z0-9]{3}\.?[A-Za-z0-9]{3}\/?[A-Za-z0-9]{4}\-?[0-9]{2}')),
    CONSTRAINT ck_cep CHECK(REGEXP_LIKE(cep,'^\d{6}[-]\d{3}$')),
    CONSTRAINT ck_telefone1 CHECK(REGEXP_LIKE(telefone1,'^\d{2}\s\d{8}$|^\d{2}\s[9]\d{8}$')),
    CONSTRAINT ck_telefone2 CHECK(REGEXP_LIKE(telefone1,'^\d{2}\s\d{8}$|^\d{2}\s[9]\d{8}$'))
}

CREATE TABLE tipo_orgao{
    orgao   CHAR(18) NOT NULL,
    tipo    VARCHAR2(13) NOT NULL,

    --chave primaria composta
    CONSTRAINT pk_tipo_orgao PRIMARY KEY(orgao,tipo),

    --chave estrangeira
    CONSTRAINT fk_tipo_orgao
        FOREIGN KEY (orgao)
        REFERENCES orgao (cnpj)
        ON DELETE CASCADE,

    --restricoes
    CONSTRAINT ck_tipo CHECK(UPPER(tipo) IN ('BENEFICENTE','REDE DE SAUDE'))
}

CREATE TABLE beneficente{
    cnpj            CHAR(18) NOT NULL,
    qtdvolunt       NUMBER,
    datafundacao    DATE,
    areaatuacao     VARCHAR2(100),

    --chave primaria
    CONSTRAINT pk_beneficente PRIMARY KEY (cnpj),

    --chave estrangeira
    CONSTRAINT fk_beneficente
        FOREIGN KEY (cnpj)
        REFERENCES orgao (cnpj)
        ON DELETE CASCADE,

}

CREATE TABLE programas{
    beneficente CHAR(18) NOT NULL,
    programa    VARCHAR2(100) NOT NULL,

    --chave primaria composta
    CONSTRAINT pk_programas PRIMARY KEY (beneficente,programa),

    --chave estrangeira
    CONSTRAINT fk_promagas
        FOREIGN KEY (beneficente)
        REFERENCES beneficente (cnpj)
        ON DELETE CASCADE,
}

CREATE TABLE rede_de_saude{
    cnpj        CHAR(18) NOT NULL,
    qtdleitos   NUMBER,
    qtduncion   NUMBER,

    --chave primaria
    CONSTRAINT pk_rede_de_saude PRIMARY KEY (cnpj),

    --chave estrangeira
    CONSTRAING fk_rede_de_saude
        FOREIGN KEY (cnpj)
        REFERENCES orgao (cnpj)
        ON DELETE CASCADE,
}

CREATE TABLE especialidades{
    rede_de_saude CHAR(18) NOT NULL,
    especialidade    VARCHAR2(100) NOT NULL,

    --chave primaria composta
    CONSTRAINT pk_especialidades PRIMARY KEY (rede_de_saude,especialidade),

    --chave estrangeira
    CONSTRAINT fk_especialidades
        FOREIGN KEY (rede_de_saude)
        REFERENCES rede_de_saude (cnpj)
        ON DELETE CASCADE,
}

CREATE TABLE sessao{
    idsessao            NUMBER NOT NULL,
    idcaso              NUMBER NOT NULL,
    tratamento          VARCHAR2(150) NOT NULL, 
    rede_de_saude       CHAR(18) NOT NULL,
    --Formato Date tem Ano Mes Dia Hora Minuto Segundo, entao talvez usa-lo para data e hora.
    --No modelo a gente separou data e hora mas aqui seria melhor juntar?
    datahora            DATE,
    obsmedicas          VARCHAR2(1000),
    resultadoesperado   VARCHAR2(1000),

    --chave primaria
    CONSTRAINT pk_idsessao PRIMARY KEY (idsessao),

    --chave secundaria
    CONSTRAINT sk_idsessao UNIQUE(idcaso,tratamento,data,hora),

    --chave estrangeira
    CONSTRAINT fk_sessao_idcaso
        FOREIGN KEY (idcaso)
        REFERENCES caso (idcaso)
        ON DELETE CASCADE,

    CONSTRAINT fk_sessao_rede_de_saude
        FOREIGN KEY (rede_de_saude)
        REFERENCES rede_de_saude (cnpj)
        ON DELETE CASCADE,
}

CREATE TABLE metricas_sessoes{
    sessao      NUMBER NOT NULL,
    metrica     VARCHAR2(150) NOT NULL,
    valor       VARCHAR2(150),

    --chave primaria composta
    CONSTRAINT pk_metricas_sessoes PRIMARY KEY (sessao,metrica),

    --chave estrangeira
    CONSTRAINT fk_metricas_sessoes
        FOREIGN KEY (sessao)
        REFERENCES sessao (idsessao)
        ON DELETE CASCADE
}