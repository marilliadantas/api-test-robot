*** Settings ***
Resource                             ../../resources/config/package.robot

*** Keywords ***
    
Send the POST request
    Fakers
    [Arguments]                      ${name}                  ${last_name}      ${email}
    ${BODYUSERS}                     Create New Users Body    ${name}           ${last_name}     ${email}
    Log                              ${BODYUSERS}
    HeadersAuth                      ${token}
    ${RESPONSE}                      Post in       /users     ${BODYUSERS}
    Set Test Variable                ${RESPONSE}
    Set Test Variable                ${id}                    ${RESPONSE.json()}[id]
    Log                              ${RESPONSE.json()}
    Log                              ${id}

Send the PUT request
    [Arguments]                      ${name}                  ${last_name}      ${email}
    ${BODYUSERS}                     Create New Users Body    ${name}           ${last_name}     ${email}
    Log                              ${BODYUSERS}
    HeadersAuth                      ${token}
    ${RESPONSE}                      Put in      /users       ${headersAuth}    ${BODYUSERS}     ${id}
    Set Test Variable                ${RESPONSE}
    Log                              ${RESPONSE.json()}

Validate values users
    [Arguments]                      ${name}                ${last_name}         ${email}
    Should Be Equal As Strings       ${name}                ${RESPONSE.json()}[name]
    Should Be Equal As Strings       ${last_name}           ${RESPONSE.json()}[last_name]
    Should Be Equal As Strings       ${email}               ${RESPONSE.json()}[email]
