Robot Framework com Biblioteca Browser.
Utilizando App actions na estrutura.

Dependências: 
Node Visual Studio Code 
Node 
Git
Python
Phyton marcando Path com todas as opções marcadas 
Instalar Python para todos usuários 
Instalar na Raiz de C: 

Instalar dependências da aplicação API:
```
Abra a pasta application/mark85/API no terminal e digite o seguinte comando

npm install
```

Instalar dependências da aplicação Web:
```
Abra a pasta application/mark85/web no terminal e digite o seguinte comando

npm install
```

Instalar dependências Robot:
```
pip install -U pip
pip install -r requirements.txt
rfbrowser init
```

Inicializar a biblioteca Browser, permitindo instalar a biblioteca e o playwright e seus navegadores suportados
```
rfbrowser init
```

configuração do banco de dados Mongo DB

```

```


Para executar o projeto localmente:
- Acesse em dois terminais, um para a pasta web e outro para a pasta api, e execute o seguinte
> npm run dev


Para os testes: 
> robot -d .\reports tests\<the_test>.robot




------


Criar banco de dados no Mongo

Crie um projeto com senha de acesso
Crie um cluster M2 Gratuito

Depois de criado o cluster, no projeto clique em conectar 
Clique em Drivers
Copie a string de conexão
Inclua no arquivo ENV do projeto na pasta API
Inclua sua senha onde está <db_password>
Inclua o nome do banco de dados a ser criado entre a barra e o ponto de interrogação /NOME DO BANCO?


Para executar a API esteja na pasta API no CMD
digite npm run dev



nome projeto
mark01
Cluster 
DB
usuário
QA
Senha
TESTE