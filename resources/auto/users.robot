*** Settings ***
Resource    ../../resources/config/package.robot

*** Keywords ***
Send the GET request
    ${RESPONSE}    Get in     /users
    Set Global Variable       ${RESPONSE}
    Log                       ${RESPONSE.json()}

Send the GET request by ID
    [Arguments]       ${id}
    ${RESPONSE}       Get Id In     /produtos                       ${id}
    Set Test Variable               ${RESPONSE}
    Log                             ${RESPONSE}
    
Send the POST request
    Fakers
    [Arguments]   ${name}    ${last_name}       ${email}
    ${BODYUSERS}       Create New Users Body    ${name}    ${last_name}     ${email}
    Log    ${BODYUSERS}
    HeadersAuth                        ${token}
    ${RESPONSE}                        Post in       /users        ${BODYUSERS}
    Set Test Variable                  ${RESPONSE}
    Log                                ${RESPONSE.json()}
    