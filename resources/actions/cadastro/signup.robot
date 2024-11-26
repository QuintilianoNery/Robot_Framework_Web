*** Settings ***
Documentation    Ações para validação de cadastro

*** Variables ***
${btn_signup}           css=a[href="/signup"]
${text_title_signup}    //h1[text()="Faça seu cadastro"]


*** Keywords    ***
Clicar em se cadastrar
    Click                      ${btn_signup}
    Wait For Elements State    ${text_title_signup}    visible    5
    Get text                   ${text_title_signup}    equal      Faça seu cadastro