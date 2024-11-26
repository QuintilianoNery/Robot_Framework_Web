*** Settings ***
Documentation         Fábrica de Dados Dinâmicos e Estáticos

Library               OperatingSystem
Library               FakerLibrary


*** Keywords  ***
Ler JSON
    [Arguments]       ${file_name}

    ${file_data}      Get File         ${EXECDIR}/resources/fixtures/${file_name}.json
    ${data}           Evaluate         json.loads('''${file_data}''')             json
    
    RETURN          ${data}


Gerar Dados de Usuário Aleatório
    ${first_name}     FakerLibrary.First_Name
    ${last_name}      FakerLibrary.Last_Name
    ${email}          FakerLibrary.Email
    ${password}       FakerLibrary.Password


    ${user_data}      Create Dictionary    first_name=${first_name}  last_name=${last_name}  password=${password}  email=${email} 

    RETURN          ${user_data}