*** Settings ***
Resource    ../../resources/config/package.robot

*** Keywords ***
Enter username and password
    [Arguments]                        ${username}              ${password}
    ${bodyLogin}      Log in      username=${username}     password=${password}
    Log      ${bodyLogin}

    ${RESPONSE}    Post in    /login        ${bodyLogin}
    Set Global Variable                     ${RESPONSE}

API should return status code
    [Arguments]                             ${statusCode}
    Should Be Equal As Strings              ${RESPONSE.status_code}       ${statusCode}
    Log                                     ${RESPONSE.status_code} 