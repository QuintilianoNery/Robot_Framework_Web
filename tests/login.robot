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
    [ tags ]                     smoke
    Fazer login com              ${static_users["valido"]["email"]}    ${static_users["valido"]["senha"]}
    Validar Login com Sucesso    ${static_users["valido"]["name"]}

Não Deve Fazer Login com Dados Inválidos
    [ tags ]                                smoke
    [Template]                              Realizar Login Inválido Com
    ${static_users["invalido"]["email"]}    ${static_users["invalido"]["senha"]}
    ${static_users["valido"]["email"]}      ${static_users["invalido"]["senha"]}
    ${static_users["invalido"]["email"]}    ${static_users["valido"]["senha"]}

Não Deve Fazer Login com dados em Branco
    Fazer login com                       ${EMPTY}                              ${static_users["valido"]["senha"]}
    Validar Login com e-mail em Branco
    Fazer login com                       ${static_users["valido"]["email"]}    ${EMPTY}
    Validar Login com senha em Branco