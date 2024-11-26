*** Settings ***
Documentation    Ações para validação da tela Home do site

Resource    ../../support/base.robot

*** Variables ***
${text_title_login}    //h1[text()="Faça seu login"]
${text_title}          Mark85 by QAx
${input_email}         css=#email
${input_password}      css=#password
${button_login}        css=#buttonLogin
${link_signup}         css=a[href="/signup"]


*** Keywords    ***
Validar home do site
    Get Title                  equal                  ${text_title}
    Wait For Elements State    ${text_title_login}    visible          ${implicit_timeout}
    Get Text                   ${text_title_login}    equal            Faça seu login
    Wait For Elements State    ${input_email}         visible          ${implicit_timeout}
    Wait For Elements State    ${input_password}      visible          ${implicit_timeout}
    Wait For Elements State    ${link_signup}         visible          ${implicit_timeout}

Acessar home do site
    Get Title    equal    ${text_title}
