*** Settings ***
Resource                            ./package.robot

*** Variables ***
${token}
${SCHEMA_USERS}                      ${EXECDIR}/resources/schemas/users/usersSchema.json
${SCHEMA_}                           ${EXECDIR}/resources/schemas/usersID/Schema.json
${BASE_URL}                          https://api-desafio-qa.onrender.com
&{HEADERS_LOGIN}                     accept=application/json
...                                  Content-Type=application/json

*** Keywords ***

Connect api
    [Arguments]                      ${endpoint}
    Create Session                   apiQA                            ${BASE_URL}    ${HEADERS_LOGIN}

Get in
    [Arguments]                      ${endpoint}
    ${RESPONSE}                      GET                              ${BASE_URL}${endpoint}   
    ...                              headers=${HEADERS_LOGIN}
    
    RETURN                           ${RESPONSE}

Get Id In
    [Arguments]                      ${endpoint}                      ${id}
    ${RESPONSE}                      GET                              ${BASE_URL}${endpoint}/${id}
    ...                              headers=${HEADERS_LOGIN}
    ...                              expected_status=any
    
    RETURN                           ${RESPONSE}

Post in
    [Arguments]                       ${endpoint}                     ${body}
    ${RESPONSE}                       POST                            ${BASE_URL}${endpoint} 
    ...                               headers=${HEADERS_LOGIN}
    ...                               json=${body}
    ...                               expected_status=any
    RETURN                            ${RESPONSE}

Put in
    [Arguments]                       ${endpoint}                     ${headers}      ${body}    ${id}
    ${response}                       PUT                             ${base_url}${endpoint}/${id}
    ...                               json=${body}
    ...                               headers=${headers}
    ...                               expected_status=any
    
    RETURN                            ${response}

Delete Id In
    [Arguments]                       ${endpoint}                     ${id}
    ${response}                       DELETE                          ${BASE_URL}${endpoint}/${id}
    ...                               headers=${HEADERS_LOGIN}
    ...                               expected_status=any
    
    RETURN                            ${response}

Validate the contract
    [Arguments]                       ${schema}
    Validate Jsonschema From File     ${RESPONSE.json()}              ${schema}

Token
    Connect api                       /login
    ${TOKEN}                          Convert To String               ${RESPONSE.json()}[token]
    Set Global Variable               ${TOKEN}

HeadersAuth
    [Arguments]                       ${token} 
    ${headersAuth}                    Create Dictionary               Authorization=${token}
    Set Test Variable                 ${headersAuth}

Validate statusCode
    [Arguments]                       ${statusCode}
    Should Be Equal As Strings        ${RESPONSE.status_code}         ${statusCode}
    Log                               ${RESPONSE.status_code}

Create user success
    Fakers
    Send the POST request             Test     Automation             testautomation10@test.com
    Set Test Variable                 ${id}                           ${RESPONSE.json()}[id]
    Log                               ${id}  

Send the GET request
    [Arguments]                       ${endpoint}
    ${RESPONSE}    Get in             ${endpoint}
    Set Global Variable               ${RESPONSE}
    Log                               ${RESPONSE.json()}

Send the GET request by ID
    [Arguments]                       ${endpoint}                     ${id}
    ${RESPONSE}       Get Id In       ${endpoint}                     ${id}
    Set Test Variable                 ${RESPONSE}
    Log                               ${RESPONSE}

Send the DELETE request
    [Arguments]                       ${endpoint}
    ${RESPONSE}      Delete Id In     ${endpoint}                     ${id}
    Set Test Variable                                                 ${RESPONSE}
    Log                                                               ${RESPONSE.json()}

Validate message
    [Arguments]    ${message}
    Should Be Equal As Strings        ${RESPONSE.json()}[message]     ${message}
    Log                               ${RESPONSE.json()}

Validate error message
    [Arguments]    ${message}
    Should Be Equal As Strings        ${RESPONSE.json()}[error]       ${message}
    Log                               ${RESPONSE.json()}