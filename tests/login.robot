*** Settings ***
Resource            ../resources/config/services.robot
Suite Setup         Connect api   /login

*** Test Cases ***
CT01: Login - Success             
    Enter username and password        admin     password
    Validate statusCode                201

CT02: Login - With blank username             
    Enter username and password        ${EMPTY}     password
    Validate statusCode                401
    Validate error message             Credenciais inválidas

CT03: Login - With invalid username             
    Enter username and password        test     password
    Validate statusCode                401
    Validate error message             Credenciais inválidas

CT04: Login - With blank password            
    Enter username and password        admin     ${EMPTY}
    Validate statusCode                401
    Validate error message             Credenciais inválidas

CT05: Login - With invalid password            
    Enter username and password        admin     test
    Validate statusCode                401
    Validate error message             Credenciais inválidas

