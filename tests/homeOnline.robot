*** Settings ***
Documentation    Site Online

Resource    ../resources/support/base.robot
Resource    ../resources/actions/home/home.robot

Test Setup       Start Application
Test Teardown    Take Screenshot

*** Test Cases ***
Garantir que o site está online
    Validar home do site