*** Settings ***
Resource            ../resources/config/services.robot
Suite Setup         Connect api   /login

*** Test Cases ***
CT01: List users         
    Send the GET request
    Validate the contract         ${SCHEMA_USERS} 
    Validate statusCode           200  

CT02: List user by ID
    Send the GET request by ID    4
    Validate statusCode           200  

CT03: Create Users
    Fakers
    Send the POST request         ${FakeFirstname}    ${FakeLastname}    ${FakeEmail}
    Validate statusCode           201

CT04: Update Users
    Create user success
    Send the PUT request          Nattan    ${FakeLastname}    testeautomation@gmail.com
    Validate statusCode           200

CT05: Delete Users
    Create user success
    Send the DELETE request       
    Validate statusCode           200 