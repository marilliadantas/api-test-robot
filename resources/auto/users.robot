*** Settings ***
Resource                             ../../resources/config/package.robot

*** Keywords ***
    
Create Users
    [Arguments]                      ${name}                  ${last_name}      ${email}
    ${USERS_BODY}                    Create New Users Body    ${name}           ${last_name}     ${email}
    Set Test Variable                ${USERS_BODY}
    Log                              ${USERS_BODY}


Validate values users
    [Arguments]                      ${name}                  ${last_name}      ${email}
    Should Be Equal As Strings       ${name}                  ${RESPONSE.json()}[name]
    Should Be Equal As Strings       ${last_name}             ${RESPONSE.json()}[last_name]
    Should Be Equal As Strings       ${email}                 ${RESPONSE.json()}[email]
