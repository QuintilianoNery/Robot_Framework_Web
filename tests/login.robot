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
    [ tags ]                     smoke1
    Fazer login com              ${static_users["usuarioValido1"]["email"]}    ${static_users["usuarioValido1"]["senha"]}
    Validar Login com Sucesso    ${static_users["usuarioValido1"]["name"]}

Não Deve Fazer Login com Dados Inválidos
    [ tags ]                                      smoke1
    [Template]                                    Realizar Login Inválido Com
    ${static_users["invalido1"]["email"]}         ${static_users["invalido1"]["senha"]}
    ${static_users["usuarioValido1"]["email"]}    ${static_users["invalido1"]["senha"]}
    ${static_users["invalido1"]["email"]}         ${static_users["usuarioValido1"]["senha"]}

Não Deve Fazer Login com Dados em Branco
    [ tags ]                              smoke1
    Fazer login com                       ${EMPTY}                                      ${static_users["usuarioValido1"]["senha"]}
    Validar Login com e-mail em Branco
    Fazer login com                       ${static_users["usuarioValido1"]["email"]}    ${EMPTY}
    Validar Login com senha em Branco