*** Settings ***
Documentation    Cenários de testes do cadastro do usuário

Library     Browser
Resource    ../resources/support/base.robot
Resource    ../resources/actions/home/home.robot
Resource    ../resources/actions/cadastro/signup.robot


Test Setup       Start Application
Test Teardown    Take Screenshot

*** Test Cases ***
Deve cadastrar um novo usuário
    Acessar home do site
    Clicar em se cadastrar
    # Preencher formulario
    # Validar cadastro com sucesso




