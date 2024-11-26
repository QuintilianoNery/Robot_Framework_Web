*** Settings ***
Documentation    Arquivo base do projeto

Library    Browser    timeout=30s

*** Variables ***
${implicit_timeout}    10
${BASE_URL}            http://localhost:3000/


*** Keywords    ***
Start Application
    New Browser    chromium            false
    New Page       ${BASE_URL}
   #Set Viewport Size       1920    1080