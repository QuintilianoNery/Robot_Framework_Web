*** Settings ***
Documentation    Cenários de testes do cadastro do usuário

Library     Browser

Resource    ../resources/support/base.robot
Resource    ../resources/actions/home/home.robot
Resource    ../resources/actions/autenticacao/signup.robot

Test Setup       Start Application
Test Teardown    Take Screenshot

*** Test Cases ***
Deve cadastrar um novo usuário
    Acessar home do site
    Clicar em Criar Conta
    Preencher Formulario
    Validar Cadastro com Sucesso