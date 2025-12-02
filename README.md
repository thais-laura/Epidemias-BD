<a id="readme-top"></a>

# Saúde Digital e Gestão Integrada de Dados Clínicos - Monitoramento de Novas Epidemia

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Sumário</summary>
  <ol>
    <li>
      <a href="#sobre-o-projeto">Sobre o Projeto</a>
      <ul>
        <li><a href="#ferramentas-utilizadas">Ferramentas Utilizadas</a></li>
      </ul>
    </li>
    <li>
      <a href="#primeiros-passos">Primeiros Passos</a>
      <ul>
        <li><a href="#pre-requisitos">Pre Requisitos</a></li>
        <li><a href="#instalação">Instalação</a></li>
      </ul>
    </li>
    <li><a href="#usando-a-aplicação">Usando a Aplicação</a></li>
  </ol>
</details>



## Sobre o Projeto
O sistema de Alerta Epidemiológico é uma aplicação com o propósito de detectar, no estágio inicial, variações anormais de casos e emitir alertas fundamentados e direcionados às áreas afetadas. Este será distribuído a redes de saúde e órgãos beneficientes voltados à prevenção de doenças.

Ciclo de operação:
1. Unidades de saúde cadastradas enviam os diagnósticos de doenças transmíssiveis dos seus pacientes.
2. Com esse monitoramento, torna-se possível a detecção de possíveis surtos.
3. Órgãos beneficentes podem alertar a população e combater de forma incisiva os meios de transmissão dessas doenças.

Para possibilitar tudo isso, foi desenvolvido um sitema de banco de dados para armazenar as informações relevantes, dos casos diagnosticados às doenças e seus transmissores.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Ferramentas Utilizadas

* [![Oracle][Oracle.com]][Oracle-url]
* [![Python][Python.com]][Python-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Primeiros Passos
Para executar a aplicação em python e utilizar todas suas funcionalidades, é necessário realizar alguns passos prévios.

### Pre Requisitos
* Cadastro: Para um órgão utilizar a aplicação parar realizar inserção de dados ou consultas, é preciso ter um cadastro como usuário do banco de dados com Nome de Usuário e Senha.

* Python: Ter Python para execução do programa. Pode-se baixar no [site](https://www.python.org/downloads/).

* npm
   ```sh
  npm install npm@latest -g
  ```
* python-oracledb: Ter a biblioteca oracledb para python. Sua instalação será explicada no próximo subcapítulo.

### Instalação

* python-oracledb: Pode-se acompanhar a documentação disponibilizada pelo [python-oracledb](https://python-oracledb.readthedocs.io/en/latest/user_guide/installation.html), mas também pode-se seguir este resumo:
    - Para Windows/Linux:
      ```sh
      python -m pip install oracledb --upgrade
      ```
    - Se estiver utilizando um proxy, utilize:
      ```sh
      python -m pip install oracledb --upgrade --proxy=http://proxy.example.com:80
      ```
* Aplicação:
    1. Clone o repositório:
        ```sh
        git clone https://github.com/thais-laura/Epidemias-BD.git
        ```
    2. Mudar o git remote url para evitar pushs acidentais ao projeto base:
        ```sh 
        git remote set-url origin github_username/repo_name
        git remote -v # confirm the changes
        ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Usando a Aplicação

Compilando e executando o código de App.py permite utilizar a aplicação pelo terminal/janela de execução. 

No menu principal, o usuário pode escolher entre 4 opções:

* Login/Logoff: Efetuar o login com Usuário e Senha cadastrada. Recomenda-se fazê-la primeiro pois estar logado é pre requisito para outras funções. Quando logado, transformase em Logoff, que permite o usuário desfazer a conexão com o banco de dados.

* Insercao: Caso logado, o usuário poderá escolher entre os tipos de inserções que deseja fazer. Em cada inserção, será pedido que o usuário insira os dados apropriados.

* Consulta: Caso logado, o usuário poderá escolher entre os tipos de consultas que deseja fazer. Para consulta especial, será pedido que o usuário insira os dados apropriados.

* Sair: Encerrar o programa.


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[Python.com]: https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54
[Python-url]: https://www.python.org/
[Oracle.com]: https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white
[Oracle-url]: https://www.oracle.com/
