*** Settings ***
Documentation    Ações para validação da tela Home do site


*** Variables ***
${text_title_login}    //h1[text()="Faça seu login"]
${text_title}          Mark85 by QAx
${input_email}         css=#email
${input_password}      css=#password
${button_login}        css=#buttonLogin
${btn_signup}          css=a[href="/signup"]


*** Keywords    ***
Validar home do site
    Get Title                  equal                  ${text_title}
    Wait For Elements State    ${text_title_login}    visible          5
    Get text_title             ${text_title_login}    equal            Faça seu login
    Wait For Elements State    ${input_email}         visible          5
    Wait For Elements State    ${input_password}      visible          5
    Wait For Elements State    ${btn_signup}          visible          5

Acessar home do site
    Get Title    equal    ${text_title}
