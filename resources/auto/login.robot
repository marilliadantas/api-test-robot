*** Settings ***
Resource    ../../resources/config/package.robot

*** Keywords ***
Enter username and password
    [Arguments]                               ${username}              ${password}
    ${LOGIN_BODY}      Create Login Body      username=${username}     password=${password}
    Log      ${LOGIN_BODY}
    ${RESPONSE}    Post in    /login          ${LOGIN_BODY}
    Set Global Variable                       ${RESPONSE}
        

API should return status code
    [Arguments]                             ${statusCode}
    Should Be Equal As Strings              ${RESPONSE.status_code}       ${statusCode}
    Log                                     ${RESPONSE.status_code} 