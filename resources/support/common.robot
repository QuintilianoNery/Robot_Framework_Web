*** Settings ***
Documentation    Arquivo com keywords comuns e que pode ser utilizadas por todos os testes

Resource    ../actions/autenticacao/login.robot
Resource    random_data.robot


*** Keywords ***
Carregar Dados de Usuários Estáticos
    [Documentation]    Deve ser utilizado nos testes quando os dados estáticos forem necessários

    ${static_users}    Run Keyword            Ler JSON           secure_data
    Run Keyword        Set Global Variable    ${static_users}


Executar Login com Usuário Estático Válido
    Run Keyword    Fazer Login Com              ${static_users["valido"]["email"]}    ${static_users["valido"]["senha"]}
    Run Keyword    Validar Login com Sucesso