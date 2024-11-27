<h1 align="center">Robot Framework com Biblioteca Browser</h1>
<h2 align="center">Utilizando App Actions na Estrutura</h2>

## Sumário
1. [Dependências para Instalação](#1-dependências-para-instalação) 
2. [Configuração do Banco de Dados MongoDB](#2-configuração-do-banco-de-dados-mongodb) 
3. [Instalação das Dependências](#3-instalação-das-dependências) 
4. [Aplicação Web](#4-aplicação-web) 
5. [Instalar dependências Robot](#5-instalar-dependências-robot) 
6. [Executando o Projeto Localmente](#6-executando-o-projeto-localmente) 
7. [Executando os Testes Automatizados e abrindo o relatório de testes](#7-executando-os-testes-automatizados-e-abrindo-o-relatório-de-testes) 


## 1. Dependências para Instalação  
Certifique-se de instalar os seguintes softwares antes de iniciar:  

1. **Node.js**  
   - Recomendado instalar a versão LTS mais recente.  

2. **Visual Studio Code**  
   - IDE sugerida para edição e execução do projeto.  

3. **Git**  
   - Controle de versão para gerenciar o código.  

4. **Python**  
   - Durante a instalação:  
     - Marque a opção `Add Python to PATH`.  
     - Selecione a instalação para **todos os usuários**.  
     - Instale na **raiz do disco C:**.  

---
## 2. Configuração do Banco de Dados MongoDB
Siga os passos abaixo para configurar o banco de dados:

1. Crie um banco de dados no MongoDB Atlas
    - Acesse o site do MongoDB Atlas.

2. Crie um novo projeto com senha de acesso
    - Defina um nome para o projeto e configure uma senha segura para o acesso.

3. Crie um Cluster Gratuito (M2)
    - Escolha a opção de cluster gratuito.

4. Conecte o projeto ao cluster
    - Após criar o cluster, clique em Connect.

5. Obtenha a String de Conexão
    - Na tela de conexão, selecione a opção Drivers.
    - Copie a string de conexão gerada.

6. Edite o arquivo .env do projeto

---
## 3. Instalação das Dependências  

### Aplicação API  
1. Abra o terminal.  
2. Navegue até a pasta: `application/mark85/API`.  
3. Execute o comando:  

   ```bash
   npm install
   ```

### 4. Aplicação Web
4. Abra o terminal.
5. Navegue até a pasta: `application/mark85/web`.
6. Execute o comando:
    ```
        npm install
    ```

### 5. Instalar dependências Robot
    ```
    pip install -U pip
    pip install -r requirements.txt
    rfbrowser init
    ```

- Navegue até a pasta: mark85/api/.
- Insira a string de conexão no arquivo .env do projeto.
- Atualize os seguintes campos na string:
    - <db_password>: substitua pela senha configurada no MongoDB.
    - <nome_do_banco>: substitua pelo nome desejado para o banco de dados.
- Exemplo: 
    ```
        mongodb+srv://QA:<db_password>@db.ame3i.mongodb.net/<nome_do_banco>?retryWrites=true&w=majority&appName=DB
    ```
---        
### 6. Executando o Projeto Localmente

1. Abra dois terminais:
    - No primeiro terminal, navegue até a pasta web e execute:
    ```
    npm run
    ```
    - No segundo terminal, navegue até a pasta api e execute:
    ```
    npm run
    ```
### 7. Executando os Testes Automatizados e abrindo o relatório de testes
    ```
    robot -d .\reports -i <tag> .\tests\<nome_do_teste>.robot; start .\reports\report.html
    ```
   - -d gera os arquivos de log na pasta reports
   - -i irá executar todos os testes com aquela tag mencionada
   - ;start executa um comando após os testes para abrir o report.html 