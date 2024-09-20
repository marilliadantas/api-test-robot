*** Settings ***
Resource            ../resources/config/services.robot
Suite Setup         Connect api   /login

*** Test Cases ***
CT01: List users         
    Send the GET request
    Validate the contract         ${SCHEMA_USERS} 
    Validade statusCode           200  

CT02: List user by ID
    Send the GET request by ID    4
    Validade statusCode           200  


CT03: Create Users
    Fakers
    Send the POST request        ${FakeNome}    ${FakeNome}    ${FakeEmail}
    Validade statusCode          201
