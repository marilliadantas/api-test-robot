*** Settings ***
Resource            ./package.robot

*** Variables ***
${token}
${BASE_URL}         https://api-desafio-qa.onrender.com
&{HEADERS_LOGIN}    accept=application/json
...                 Content-Type=application/json

*** Keywords ***
Connect api
    [Arguments]                       ${endpoint}
    Create Session    apiQA    ${BASE_URL}    ${HEADERS_LOGIN}

Post in
    [Arguments]         ${endpoint}   ${body}
    ${response}         POST          ${BASE_URL}${endpoint} 
    ...                 json=${body}    
    ...                 headers=${HEADERS_LOGIN}
    ...                 expected_status=any
    
    RETURN              ${response}

Log in
    [Arguments]    ${username}    ${password}
    ${login}=    Create Dictionary
    IF        "${username}" != 'None'      Set To Dictionary       ${login}       username       ${username}  
    IF        "${password}" != "None"      Set To Dictionary       ${login}       password       ${password}   
    RETURN     ${login}

Get in
    [Arguments]         ${endpoint}
    ${response}         GET            ${BASE_URL}${endpoint}   
    ...                 headers=${HEADERS_LOGIN}
    
    RETURN              ${response}