*** Settings ***
Resource       ../config/package.robot

*** Keywords ***
Create Login Body
    [Arguments]    ${username}    ${password}
    ${LOGIN_BODY}=    Create Dictionary
    IF        "${username}" != 'None'      Set To Dictionary       ${LOGIN_BODY}       username       ${username}  
    IF        "${password}" != "None"      Set To Dictionary       ${LOGIN_BODY}       password       ${password}   
    RETURN     ${LOGIN_BODY}

Create New Users Body
    [Arguments]    ${cname}    ${clast_name}    ${cemail}
    ${USERS}=    Create Dictionary
    Run Keyword If    "${cname}" != 'None'       Set To Dictionary    ${USERS}    name        ${cname}
    Run Keyword If    "${clast_name}" != 'None'  Set To Dictionary    ${USERS}    last_name   ${clast_name}
    Run Keyword If    "${cemail}" != 'None'      Set To Dictionary    ${USERS}    email       ${cemail}
    [Return]    ${USERS}

