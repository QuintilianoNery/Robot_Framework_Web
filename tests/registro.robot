*** Settings ***
Documentation    Cenários de testes do cadastro do usuário

Resource    ../resources/support/base.robot
Resource    ../resources/actions/autenticacao/signup.robot
Resource    ../resources/support/common.robot
Resource    ../resources/support/random_data.robot

Suite Setup    Carregar Dados de Usuários Estáticos

Test Setup       Start Application
Test Teardown    Take Screenshot

*** Variables ***
${text_message_notice_sucess}    Boas vindas ao Mark85, o seu gerenciador de tarefas. 
${text_message_notice_error}     Oops! Já existe uma conta com o e-mail informado.

*** Test Cases ***
Deve cadastrar novo usuário com dados fixos
    [ tags ]                                        smoke
    Remover usuario pelo email do banco de dados    ${static_users["valido"]["email"]}
    Clicar em Criar Conta
    Preencher Formulario dados fixos                ${static_users["valido"]["name"]}     ${static_users["valido"]["email"]}    ${static_users["valido"]["senha"]}
    Validar mensagem                                ${text_message_notice_sucess}


Deve cadastrar novo usuário com dados randômicos
    [ tags ]                                random
    ${random_user}                          Gerar Dados de Usuário Aleatório
    Clicar em Criar Conta
    Preencher Formulario dados randômico    ${random_user["first_name"]}        ${random_user["email"]}    ${random_user["password"]}
    Validar mensagem                        ${text_message_notice_sucess}

Não deve permitir o cadastro com e-mail duplicado
    [ tags ]                            smoke
    Clicar em Criar Conta
    Preencher Formulario dados fixos    ${static_users["valido"]["name"]}    ${static_users["valido"]["email"]}    ${static_users["valido"]["senha"]}
    Validar mensagem                    ${text_message_notice_error}