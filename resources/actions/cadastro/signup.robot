*** Settings ***
Documentation    Ações para validação de cadastro

Library     FakerLibrary
Resource    ../../support/factory.robot
Resource    ../../support/base.robot


*** Variables ***
${link_signup}          css=a[href="/signup"]
${text_title_signup}    //h1[text()="Faça seu cadastro"]
# Dados Pessoais para registro
${input_name}        css=#name
${input_email}       css=#email
${input_password}    css=#password
${btn_signup}        css=#buttonSignup
# Mensagem
${txt_my_account}         div[class="notice success"]
${text_message_sucess}    Boas vindas ao Mark85, o seu gerenciador de tarefas.


*** Keywords    ***
Clicar em Criar Conta
    Click                      ${link_signup}
    Wait For Elements State    ${text_title_signup}    visible    ${implicit_timeout}
    Get text                   ${text_title_signup}    equal      Faça seu cadastro

Preencher Formulario
    ${random_user}               Gerar Dados de Usuário Aleatório
    Fill Text                    ${input_name}                       ${random_user["first_name"]}
    Fill Text                    ${input_email}                      ${random_user["email"]}
    Fill Text                    ${input_password}                   ${random_user["password"]}
    Clicar no botão Cadastrar

Clicar no botão Cadastrar
    click    ${btn_signup}

Validar Cadastro com Sucesso
    Wait For Elements State    ${txt_my_account}    visible     ${implicit_timeout}
    Get Text                   ${txt_my_account}    contains    ${text_message_sucess}
