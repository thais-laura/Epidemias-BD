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
        print(f"Erro conectando a base de dados: {e}")

    finally:
        return connection, user, log
    
def is_float(element: any) -> bool:
    if element is None: 
        return False
    try:
        float(element)
        return True
    except ValueError:
        return False

def inserir_cidade(connection):
    query_city = input("Digite o nome da cidade (Ex: SAO PAULO): ").upper()
    query_state = input("Digite o nome do estado (EX: SP): ").upper()
    query_pop = input("Digite o numero de habitantes da cidade (Ex: 10235): ")
    if( not query_pop.isnumeric() or query_pop=="NULO"): query_pop = [None]
    query_area = input("Digite a area em quilometros quadrados da cidade (EX: 1032.00): ")
    if( query_area.isnumeric()): query_area = query_area+".00"
    if( not is_float(query_area) ): query_area = [None]
    with connection.cursor() as cursor:
        sql_cidade = "INSERT INTO cidade (nome, estado, qtdhab, areaterrit) VALUES (:query_city, :query_state, :query_pop, :query_area)"
        cursor.execute(sql_cidade,query_city=query_city,query_state=query_state,query_pop=query_pop,query_area=query_area)
        connection.commit()
    return

def inserir_doenca(connection):
    query_nomecientif = input("Digite o nome cientifico da doenca (Ex: SARS-COV-2): ").upper()
    query_nomepopular = input("Digite o nome popular da doenca (Ex: COVID-19): ").upper()
    query_letalidade = input("Digite a taxa de letalidade da doenca (Ex: 0.03): ").upper()
    query_sazonalidade = input("Digite a estacao do ano com maior taxa de casos da doenca (Ex: INVERNO): ").upper()
    query_cid10 = input("Digite o codigo CID10 da doenca (ex: A15): ").upper()
    query_tempomedio = input("Digite o tempo medio de duracao da doenca (ex: A15): ")
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
            opt = input("Escolha uma opção:")
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
                print("logando....")
                connection, user, log = user_login()
            else:
                print("Deslogando....")
                user=None
                if(log):connection.close()
                log=False
        elif opt == 2:
            print("inserindo dados....")
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