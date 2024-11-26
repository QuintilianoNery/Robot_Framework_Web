*** Settings ***
Documentation    Ações para validação do login

Resource    ../../support/base.robot

*** Variables ***
${input_email}         css=#email
${input_password}      css=#password
${btn_submit_login}    css=#buttonLogin
${text_name_user}      css=div[class="right"]
#Componentes do pop-up de erro
${notice_error_popup}    div[class="notice error"]
${class_txt_error}       .notice p
${txt_error}             Ocorreu um erro ao fazer login, verifique suas credenciais.
#componentes do campo em branco
${alert_text_error}             css=small[class="alert-error"]
${text_alert_error_password}    Informe sua senha
${text_alert_error_email}       Informe seu e-mail


*** Keywords ***

Fazer Login Com
    [Arguments]    ${email}               ${password}
    Fill Text      ${input_email}         ${email}
    Fill Secret    ${input_password}      $password
    Click          ${btn_submit_login}

Validar Login com Sucesso
    [Arguments]                ${name_user}
    Wait For Elements State    ${text_name_user}    visible     ${implicit_timeout}
    Get text                   ${text_name_user}    contains    ${name_user}

Validar Login com Inválido
    Wait For Elements State    ${notice_error_popup}    visible     ${implicit_timeout}
    Wait For Elements State    ${class_txt_error}       visible     ${implicit_timeout}
    Get Text                   ${class_txt_error}       contains    ${txt_error}

Validar Login com e-mail em Branco
    Wait For Elements State    ${alert_text_error}    visible    ${implicit_timeout}
    Get Text                   ${alert_text_error}    equal      ${text_alert_error_email}

Validar Login com senha em Branco
    Wait For Elements State    ${alert_text_error}    visible    ${implicit_timeout}
    Get Text                   ${alert_text_error}    equal      ${text_alert_error_password}

Realizar Login Inválido Com
    [Arguments]                   ${email}               ${password}
    Fill Text                     ${input_email}         ${email}
    Fill Secret                   ${input_password}      $password
    Click                         ${btn_submit_login}
    Validar Login com Inválido
