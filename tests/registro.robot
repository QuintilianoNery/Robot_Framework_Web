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
    Remover usuario pelo email do banco de dados    ${static_users["usuarioValido1"]["email"]}
    Clicar em Criar Conta
    Preencher Formulario dados fixos                ${static_users["usuarioValido1"]["name"]}     ${static_users["usuarioValido1"]["email"]}    ${static_users["usuarioValido1"]["senha"]}
    Validar mensagem                                ${text_message_notice_sucess}


Deve cadastrar novo usuário com dados randômicos
    [ tags ]                                        random                            
    ${random_user}                                  Gerar Dados de Usuário Aleatório
    Clicar em Criar Conta
    Preencher Formulario dados randômico            ${random_user["first_name"]}        ${random_user["email"]}    ${random_user["password"]}
    Validar mensagem                                ${text_message_notice_sucess}
    Remover usuario pelo email do banco de dados    ${random_user["email"]}


Não deve permitir o cadastro com e-mail duplicado
    [ tags ]                                        smoke2
    Remover usuario pelo email do banco de dados    ${static_users["usuarioValido2"]["email"]}
    Incluir usuario no banco de dados               ${static_users["usuarioValido2"]["name"]}     ${static_users["usuarioValido2"]["email"]}    ${static_users["usuarioValido2"]["senha"]}
    Clicar em Criar Conta
    Preencher Formulario dados fixos                ${static_users["usuarioValido2"]["name"]}     ${static_users["usuarioValido2"]["email"]}    ${static_users["usuarioValido2"]["senha"]}
    Validar mensagem                                ${text_message_notice_error}