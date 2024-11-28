*** Settings ***
Documentation    Cenários de testes de login

Resource    ../resources/support/base.robot
Resource    ../resources/actions/autenticacao/login.robot
Resource    ../resources/support/common.robot

Suite Setup    Carregar Dados de Usuários Estáticos

Test Setup       Start Application
Test Teardown    Take Screenshot

*** Test Cases ***
Deve Fazer Login com Dados Válidos
    [ tags ]                                        smoke
    Remover usuario pelo email do banco de dados    ${static_users["usuario_valido1"]["email"]}
    Incluir usuario no banco de dados               ${static_users["usuario_valido1"]["name"]}     ${static_users["usuario_valido1"]["email"]}    ${static_users["usuario_valido1"]["senha"]}

    Fazer login com              ${static_users["usuario_valido1"]["email"]}    ${static_users["usuario_valido1"]["senha"]}
    Validar Login com Sucesso    ${static_users["usuario_valido1"]["name"]}

Não Deve Fazer Login com Dados Inválidos
    [ tags ]                                         smoke
    [Template]                                       Realizar Login Inválido Com
    ${static_users["usuario_invalido1"]["email"]}    ${static_users["usuario_invalido1"]["senha"]}
    ${static_users["usuario_valido1"]["email"]}      ${static_users["usuario_invalido1"]["senha"]}
    ${static_users["usuario_invalido1"]["email"]}    ${static_users["usuario_valido1"]["senha"]}

Não Deve Fazer Login com Dados em Branco
    [ tags ]                              smoke
    Fazer login com                       ${EMPTY}                                       ${static_users["usuario_valido1"]["senha"]}
    Validar Login com e-mail em Branco
    Fazer login com                       ${static_users["usuario_valido1"]["email"]}    ${EMPTY}
    Validar Login com senha em Branco