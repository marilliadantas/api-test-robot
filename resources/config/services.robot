*** Settings ***
Resource            ./package.robot

*** Variables ***
${token}
${SCHEMA_USERS}     ${EXECDIR}/resources/schemas/users/usersSchema.json
${SCHEMA_USERSID}   ${EXECDIR}/resources/schemas/usersID/usersSchemaID.json
${BASE_URL}         https://api-desafio-qa.onrender.com
&{HEADERS_LOGIN}    accept=application/json
...                 Content-Type=application/json

*** Keywords ***
Connect api
    [Arguments]                       ${endpoint}
    Create Session    apiQA    ${BASE_URL}    ${HEADERS_LOGIN}

Post in
    [Arguments]         ${endpoint}   ${body}
    ${RESPONSE}         POST          ${BASE_URL}${endpoint} 
    ...                 json=${body}    
    ...                 headers=${HEADERS_LOGIN}
    ...                 expected_status=any
    
    RETURN              ${RESPONSE}

Log in
    [Arguments]    ${username}    ${password}
    ${LOGIN_BODY}=    Create Dictionary
    IF        "${username}" != 'None'      Set To Dictionary       ${LOGIN_BODY}       username       ${username}  
    IF        "${password}" != "None"      Set To Dictionary       ${LOGIN_BODY}       password       ${password}   
    RETURN     ${LOGIN_BODY}

Get in
    [Arguments]         ${endpoint}
    ${RESPONSE}         GET            ${BASE_URL}${endpoint}   
    ...                 headers=${HEADERS_LOGIN}
    
    RETURN              ${RESPONSE}

Get Id In
    [Arguments]         ${endpoint}    ${id}
    ${RESPONSE}         GET            ${BASE_URL}${endpoint}/${id}
    ...                 headers=${HEADERS_LOGIN}
    ...                 expected_status=any
    
    RETURN              ${RESPONSE}