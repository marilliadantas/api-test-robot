*** Settings ***
Resource                                    ../../resources/config/package.robot

*** Keywords ***
Create Login
    [Arguments]                             ${username}                  ${password}
    ${LOGIN_BODY}                           Create Login Body            username=${username}     password=${password}
    Set Test Variable                       ${LOGIN_BODY}
    Log                                     ${LOGIN_BODY}

API should return status code
    [Arguments]                             ${statusCode}
    Should Be Equal As Strings              ${RESPONSE.status_code}       ${statusCode}
    Log                                     ${RESPONSE.status_code} 