*** Settings ***
Documentation    Ações para validação de cadastro

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
${notice_popup}               css=div[class*="notice-container"]
${notice_register_success}    css=.notice p



*** Keywords    ***
Clicar em Criar Conta
    Click                      ${link_signup}
    Wait For Elements State    ${text_title_signup}    visible    ${implicit_timeout}
    Get text                   ${text_title_signup}    equal      Faça seu cadastro

Preencher Formulario dados fixos
    [Arguments]                  ${name}              ${email}       ${password}
    Fill Text                    ${input_name}        ${name}
    Fill Text                    ${input_email}       ${email}
    Fill Text                    ${input_password}    ${password}
    Clicar no botão Cadastrar

Preencher Formulario dados randômico
    [Arguments]                  ${name}              ${email}       ${password}
    Fill Text                    ${input_name}        ${name}
    Fill Text                    ${input_email}       ${email}
    Fill Text                    ${input_password}    ${password}
    Clicar no botão Cadastrar


Clicar no botão Cadastrar
    click    ${btn_signup}

Validar mensagem
    [Arguments]                ${text_message_notice}
    Wait For Elements State    ${notice_popup}               visible     ${implicit_timeout}
    Wait For Elements State    ${notice_register_success}    visible     ${implicit_timeout}
    Get Text                   ${notice_register_success}    contains    ${text_message_notice}
