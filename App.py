import re
import oracledb
import getpass

def menu(log,user):
    print("----------- MENU -----------")
    print(f"Usuario: {user}")
    if(not log):print("1 - Login")
    else: print("1 - Logoff")
    print("2 - Inserção")
    print("3 - Consulta")
    print("4 - Sair")
    print("----------------------------")

def menu_consulta(user):
    print("----------- MENU -----------")
    print(f"Usuario: {user}")
    print("1 - Cidades")
    print("2 - Doencas")
    print("3 - Especial")
    print("4 - Voltar")
    print("----------------------------")

def menu_inserir(user):
    print("----------- MENU -----------")
    print(f"Usuario: {user}")
    print("1 - Cidades")
    print("2 - Doencas")
    print("3 - Voltar")
    print("----------------------------")

def user_login():
    user = input("Digite seu usuario: ")

    psswrd = getpass.getpass(prompt="Digite sua senha: ")

    try:
        connection = oracledb.connect(
            user = user, password = psswrd,
            host = 'orclgrad1.icmc.usp.br', port = '1521', service_name = 'pdb_elaine.icmc.usp.br'
        )
        log = True
        print("Conectado a base de dados com sucesso!")
    except oracledb.Error as e:
        log = False
        connection = 0
        user = None
        #print(f"Erro conectando a base de dados: {e}")
        print('Login e/ou senha inválidos')

    finally:
        return connection, user, log
    
def in_treatm(buffer):
    return str(buffer).upper().strip()
    
def is_float(element: any) -> bool:
    try:
        float(element)
        return True
    except ValueError:
        return False
    
def is_null(value):
    if value is None:
        return True
    text = str(value).strip().lower()
    return text in {"", "null", "nulo", "none"}

def inserir_cidade(connection):
    print("Adicione, pelo menos, o nome e o estado da cidade")

    buffer = input("Digite o nome da cidade (Ex: SAO PAULO): ")
    query_city = in_treatm(buffer)
    if is_null(query_city):
        print("Nome da cidade é obrigatório. Encerrando...")
        return
    
    buffer = input("Digite o nome do estado (EX: SP): ")
    query_state = in_treatm(buffer)
    if is_null(query_state):
        print("Nome do estado é obrigatório. Encerrando...")
        return
    if len(query_state) != 2:
        print("Estado deve ter 2 caracteres. Encerrando...")
        return

    buffer = input("Digite o numero de habitantes (Ex: 10235): ")
    query_pop = in_treatm(buffer)
    if is_null(query_pop):
        query_pop = None
    elif query_pop.isdigit(): 
        query_pop = int(query_pop)
    else:
        print("Valor inválido para habitantes. Usando NULL.")
        query_pop = None
    
    buffer = input("Digite a área em km² (Ex: 1032.00): ")
    query_area = in_treatm(buffer)
    if is_null(query_area):
        query_area = None
    elif is_float(query_area):
        query_area = round(float(query_area), 2)
    else:
        print("Valor inválido para área. Usando NULL.")
        query_area = None

    print("o que vamos inserir para cidade....")
    print(query_city, query_state, query_pop, query_area)

    with connection.cursor() as cursor:
        sql_cidade = "INSERT INTO cidade (nome, estado, qtdhab, areaterrit) VALUES (:query_city, :query_state, :query_pop, :query_area)"
        cursor.execute(sql_cidade,query_city=query_city,query_state=query_state,query_pop=query_pop,query_area=query_area)
        connection.commit()
    return

def inserir_doenca(connection):
    buffer = input("Digite o nome cientifico da doenca (Ex: SARS-COV-2): ")
    query_nomecientif = in_treatm(buffer)
    if is_null(query_nomecientif):
        print("Nome cientifico é obrigatório. Encerrando...")
        return
    
    buffer = input("Digite o nome popular da doenca (Ex: COVID-19): ")
    query_nomepopular = in_treatm(buffer)
    if is_null(query_nomepopular):
        print("Nome popular é obrigatório. Encerrando...")
        return
    
    buffer = input("Digite a taxa de letalidade da doenca (Ex: 0.03, entre 0 e 1): ")
    query_letalidade = in_treatm(buffer)
    if is_null(query_letalidade):
        query_arquery_letalidadeea = None
    elif is_float(query_letalidade):
        valor = float(query_letalidade)
        if 0 <= valor <= 1:
            query_letalidade = round(valor, 2)
        else:
            print("Valor fora do intervalo [0, 1]. Usando NULL.")
            query_letalidade = None
    else:
        print("Valor inválido para letalidade. Usando NULL.")
        query_letalidade = None

    buffer = input("Digite a estacao do ano com maior taxa de casos da doenca (Opções: INVERNO, PRIMAVERA, VERAO, OUTONO, TODAS): ")
    query_sazonalidade = in_treatm(buffer)
    if query_sazonalidade not in {"INVERNO", "PRIMAVERA", "VERAO", "OUTONO", "TODAS"}:
        print("Valor inválido para sazonalidade. Usando NULL.")
        query_sazonalidade = None

    buffer = input("Digite o codigo CID10 da doenca (ex: A15): ")
    query_cid10 = in_treatm(buffer)
    # REGEX CID10
    cid10_pattern = r"^[A-TV-Z][0-9]{2}(\.[0-9A-TV-Z]{1,4})?$"
    if query_cid10 and not re.match(cid10_pattern, query_cid10):
        print("Código CID10 inválido. Usando NULL.")
        query_cid10 = None
        
    buffer = input("Digite o tempo medio de duracao da doenca (ex: 15 DIAS, 3 MESES): ")
    query_tempomedio = in_treatm(buffer)
    if is_null(query_tempomedio):
        query_tempomedio = None
    elif query_tempomedio.isdigit(): 
        query_tempomedio = int(query_tempomedio)
    else:
        print("Valor inválido para habitantes. Usando NULL.")
        query_tempomedio = None

    print("o que vamos inserir para doenca....")
    print(query_nomecientif, '\n', query_nomepopular, query_letalidade, query_sazonalidade, query_cid10, query_tempomedio)

    with connection.cursor() as cursor:
        sql_cidade = "insert into doenca (nomecientif, nomepopular, letalidade, sazonalidade, cid10, tempomedio) values (:query_nomecientif, :query_nomepopular, :query_letalidade, :query_sazonalidade, :query_cid10, :query_tempomedio)"
        cursor.execute(sql_cidade, query_nomecientif=query_nomecientif, query_nomepopular=query_nomepopular, query_letalidade=query_letalidade, query_sazonalidade=query_sazonalidade, query_cid10=query_cid10, query_tempomedio=query_tempomedio)
        connection.commit()
    return

def inserir_dados(log, user, connection):
    opt = 0
    flag = 1
    if(log):
        while(flag):
            menu_inserir(user)
            opt = input("Escolha uma opção: ")
            if not opt.isdigit():
                print("Opção inválida")
                continue
            opt = int(opt)
            if opt == 1:
                inserir_cidade(connection)
            elif opt == 2:
                inserir_doenca(connection)
            elif opt == 3:
                flag = 0
            else:
                print("Opção inválida")

    else: print("Usuário precisa estar conectado a base de dados para realizar insercoes!")
    return

def consulta_cidade(connection):
    with connection.cursor() as cursor:
        sql_cidade = "SELECT nome, estado FROM cidade"
        cursor.execute(sql_cidade)
        columns = [col.name for col in cursor.description]
        print (columns)
        for (r) in cursor:
            print(r)
    return

def consulta_doenca(connection):
    with connection.cursor() as cursor:
        sql_doenca = "SELECT nomecientif FROM doenca"
        cursor.execute(sql_doenca)
        columns = [col.name for col in cursor.description]
        print (columns)
        for (r) in cursor:
            print(r)
    return

def consulta_especial(connection):
    print("Número de casos de uma doenca por faixa etária, de uma cidade, por ano.")
    cidade_estado = input("Digite o nome de uma cidade e seu estado (Ex: SAO PAULO-SP): ").upper()
    print(cidade_estado)
    tokens = cidade_estado.split('-')
    #tratar erro
    doenca = input("Digite o nome cientifico de uma doenca (Ex: SARS-COV-2): ").upper()
    #tratar erro
    print(tokens, doenca)
    with connection.cursor() as cursor:
        sql_especial = """SELECT S3.ano_caso, COUNT(*) AS nro_casos , S3.faixa_etaria FROM   (SELECT S2.idcaso,
        (TRUNC(months_between(S2.datainicio, p.datanascim) / 12)) AS idade,
        (CASE 
        WHEN (TRUNC(months_between(S2.datainicio, p.datanascim) / 12)) BETWEEN 0 AND 9  THEN 'CRIANCA'
        WHEN (TRUNC(months_between(S2.datainicio, p.datanascim) / 12)) BETWEEN 10 AND 19 THEN 'JOVEM'
        WHEN (TRUNC(months_between(S2.datainicio, p.datanascim) / 12)) BETWEEN 20 AND 59 THEN 'ADULTO'
        ELSE 'IDOSO' END) AS faixa_etaria,
        EXTRACT(YEAR FROM S2.datainicio) AS ano_caso
        FROM (SELECT c.idcaso, c.paciente, c.datainicio 
            FROM caso c JOIN (SELECT *
            FROM regiao r
            WHERE (r.nomecidade = :query_city AND r.estadocidade = :query_state)) S1
            ON ( c.REDE_DE_SAUDE = S1.rede_de_saude)
            WHERE c.doenca = :query_disease 
            ) S2 JOIN paciente p
            ON (S2.paciente=p.idpaciente)
        ) S3
        GROUP BY S3.ano_caso, S3.faixa_etaria
        ORDER BY S3.ano_caso DESC, S3.faixa_etaria """
        cursor.execute(sql_especial,query_city = tokens[0], query_state = tokens[1], query_disease = doenca)
        columns = [col.name for col in cursor.description]
        print (columns)
        for (r) in cursor:
            print(r)
    return

def consultar(log, user, connection):
    opt = 0
    flag = 1
    if(log):
        while(flag):
            menu_consulta(user)
            opt = input("Escolha uma opção:")
            if not opt.isdigit():
                print("Opção inválida")
                continue
            opt = int(opt)
            if opt == 1:
                consulta_cidade(connection)
            elif opt == 2:
                consulta_doenca(connection)
            elif opt == 3:
                consulta_especial(connection)
            elif opt == 4:
                flag=0
            else:
                print("Opção inválida")

    else: print("Usuário precisa estar conectado a base de dados para realizar consultas!")
    return

def main():
    user = None
    connection = None
    flag = 1
    log = False
    
    while(flag):
        menu(log,user)
        opt = input("Escolha uma opção: ")

        if not opt.isdigit():
            print("Opção inválida")
            continue
        
        opt = int(opt)

        if opt == 1:
            if (not log):
                #print("logando....")
                connection, user, log = user_login()
            else:
                print("Deslogando....")
                user=None
                if(log):connection.close()
                log=False
        elif opt == 2:
            #print("inserindo dados....")
            inserir_dados(log=log, user=user, connection=connection)
        elif opt == 3:
            consultar(log=log, user=user, connection=connection)
        elif opt == 4:
            print("Encerrando...")
            user=None
            if(log): connection.close()
            log=False
            flag = 0
        else:
            print("Opção inválida")

main()