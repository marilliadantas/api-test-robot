*** Settings ***
Resource                               ../resources/config/services.robot
Suite Setup                            Connect api   /login

*** Test Cases ***
CT01: List Crud         
    Send the GET request               /crud
    Validate the contract              ${SCHEMA_CRUD} 
    Validate statusCode                200  

CT02: List Crud by ID
    Create Crud                        Test               testautomation10@test.com    20    81999101010    Street Test    QA    The Best
    Send the POST request              /crud              ${CRUD_BODY}  
    Send the GET request by ID         /crud              ${id}
    Validate statusCode                200
    Validate values crud               Test               testautomation10@test.com    20    81999101010    Street Test    QA    The Best
    Send the DELETE request            /crud              ${id}

CT03: List user by ID
    Send the GET request by ID         /crud              600
    Validate statusCode                404
    Validate message                   Usuário não encontrado

CTO4: Create Crud Success
    Create Crud                        Test               testautomation10@test.com    20    81999101010    Street Test    QA    The Best
    Send the POST request              /crud              ${CRUD_BODY} 
    Validate statusCode                201
    Send the DELETE request            /crud              ${id}

CT05: Crud - With blank nome
    Create Crud                        ${EMPTY}           testautomation10@test.com    20    81999101010    Street Test    QA    The Best
    Send the POST request              /crud              ${CRUD_BODY} 
    Validate statusCode                400
    Validate message errors            O campo nome é obrigatório

CT06: Crud - With blank email
    Create Crud                        Test               ${EMPTY}                   20    81999101010    Street Test    QA    The Best
    Send the POST request              /crud              ${CRUD_BODY} 
    Validate statusCode                400
    Validate message errors 2          O campo email é obrigatório

CT07: Crud - With invalid email
    Create Crud                        Test               test@a                     20    81999101010    Street Test    QA    The Best
    Send the POST request              /crud              ${CRUD_BODY} 
    Validate statusCode                400
    Validate message errors            Deve ser um email válido

CT08: Crud - With blank idade
    Create Crud                        Test               estautomation10@test.com     ${EMPTY}    81999101010    Street Test    QA    The Best
    Send the POST request              /crud              ${CRUD_BODY} 
    Validate statusCode                400
    Validate message errors 2          O campo idade é obrigatório

CT09: Crud - With invalid idade
    Create Crud                        Test               estautomation10@test.com     10    81999101010    Street Test    QA    The Best
    Send the POST request              /crud              ${CRUD_BODY} 
    Validate statusCode                400
    Validate message errors            A idade deve ser um número inteiro válido e maior que 18

CT10: Crud - With blank telefone
    Create Crud                        Test               estautomation10@test.com     20    ${EMPTY}    Street Test    QA    The Best
    Send the POST request              /crud              ${CRUD_BODY} 
    Validate statusCode                400
    Validate message errors            O campo telefone é obrigatório

CT11: Crud - With blank endereço
    Create Crud                        Test               estautomation10@test.com     20    81999101010    ${EMPTY}      QA    The Best
    Send the POST request              /crud              ${CRUD_BODY} 
    Validate statusCode                400
    Validate message errors            O campo endereço é obrigatório

CT12: Crud - With blank profissão
    Create Crud                        Test               estautomation10@test.com     20    81999101010    Street Test   ${EMPTY}    The Best
    Send the POST request              /crud              ${CRUD_BODY} 
    Validate statusCode                400
    Validate message errors            O campo profissão é obrigatório

CT13: Crud - With blank profissão
    Create Crud                        Test               estautomation10@test.com     20    81999101010    Street Test   QA    ${EMPTY}
    Send the POST request              /crud              ${CRUD_BODY} 
    Validate statusCode                400
    Validate message errors            O campo empresa é obrigatório