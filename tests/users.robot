*** Settings ***
Resource            ../resources/config/services.robot
Suite Setup         Connect api   /login

*** Test Cases ***
CT01: List users         
    Send the GET request          /users
    Validate the contract         ${SCHEMA_USERS} 
    Validate statusCode           200  

CT02: List user by ID
    Create user success
    Send the GET request by ID    /users    ${id}
    Validate statusCode           200
    Validate values users         Test    Automation    testautomation10@test.com
    Send the DELETE request       /users

CT03: Create Users
    Fakers
    Send the POST request         ${FakeFirstname}    ${FakeLastname}    ${FakeEmail}
    Validate statusCode           201
    Send the DELETE request       /users

CT04: Update Users
    Create user success
    Send the PUT request          Nattan    Test    nattantest@gmail.com
    Validate statusCode           200
    Validate values users         Nattan    Test    nattantest@gmail.com
    Send the DELETE request       /users

CT05: Delete Users
    Create user success
    Send the DELETE request       /users
    Validate statusCode           200
    Validate message              User id ${id} deleted.
