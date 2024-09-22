*** Settings ***
Resource            ../resources/config/services.robot
Suite Setup         Connect api   /login

*** Test Cases ***
CT01: Login - Success             
    Create Login                      admin     password
    Send the POST request             /login    ${LOGIN_BODY}   
    Validate statusCode               201

CT02: Login - With blank username             
    Create Login                       ${EMPTY}     password
    Send the POST request              /login    ${LOGIN_BODY}   
    Validate statusCode                401
    Validate error message             Credenciais inválidas

CT03: Login - With invalid username             
    Create Login                       test     password
    Send the POST request              /login    ${LOGIN_BODY}   
    Validate statusCode                401
    Validate error message             Credenciais inválidas

CT04: Login - With blank password            
    Create Login                       admin     ${EMPTY}
    Send the POST request              /login    ${LOGIN_BODY}   
    Validate statusCode                401
    Validate error message             Credenciais inválidas

CT05: Login - With invalid password            
    Create Login                       admin     test
    Send the POST request              /login    ${LOGIN_BODY}   
    Validate statusCode                401
    Validate error message             Credenciais inválidas

