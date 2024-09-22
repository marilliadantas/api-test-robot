*** Settings ***
Resource                             ./package.robot

*** Variables ***
${token}
${SCHEMA_USERS}                      ${EXECDIR}/resources/schemas/users/usersSchema.json
${SCHEMA_CRUD}                       ${EXECDIR}/resources/schemas/crud/crudSchema.json
${BASE_URL}                          https://api-desafio-qa.onrender.com
&{HEADERS_LOGIN}                     accept=application/json
...                                  Content-Type=application/json

*** Keywords ***

Connect api
    [Arguments]                      ${endpoint}
    Create Session                   apiQA                      ${BASE_URL}    ${HEADERS_LOGIN}

Get in
    [Arguments]                      ${endpoint}
    ${RESPONSE}                      GET                        ${BASE_URL}${endpoint}   
    ...                              headers=${HEADERS_LOGIN}
    RETURN                           ${RESPONSE}

Get Id In
    [Arguments]                      ${endpoint}                ${id}
    ${RESPONSE}                      GET                        ${BASE_URL}${endpoint}/${id}
    ...                              headers=${HEADERS_LOGIN}
    ...                              expected_status=any
    RETURN                           ${RESPONSE}

Post in
    [Arguments]                      ${endpoint}                ${body}
    ${RESPONSE}                      POST                       ${BASE_URL}${endpoint} 
    ...                              headers=${HEADERS_LOGIN}
    ...                              json=${body}
    ...                              expected_status=any
    RETURN                           ${RESPONSE}

Put in
    [Arguments]                      ${endpoint}                ${body}    ${id}
    ${RESPONSE}                      PUT                        ${base_url}${endpoint}/${id}
    ...                              json=${body}
    ...                              headers=${HEADERS_LOGIN}
    ...                              expected_status=any
    RETURN                           ${RESPONSE}

Delete Id In
    [Arguments]                      ${endpoint}                ${id}
    ${RESPONSE}                      DELETE                     ${BASE_URL}${endpoint}/${id}
    ...                              headers=${HEADERS_LOGIN}
    ...                              expected_status=any
    RETURN                           ${RESPONSE}

Validate the contract
    [Arguments]                      ${schema}
    Validate Jsonschema From File    ${RESPONSE.json()}         ${schema}

Validate statusCode
    [Arguments]                      ${statusCode}
    Should Be Equal As Strings       ${RESPONSE.status_code}    ${statusCode}
    Log                              ${RESPONSE.status_code}

Send the GET request
    [Arguments]                      ${endpoint}
    ${RESPONSE}    Get in            ${endpoint}
    Set Global Variable              ${RESPONSE}
    Log                              ${RESPONSE.json()}

Send the GET request by ID
    [Arguments]                      ${endpoint}                ${id}
    ${RESPONSE}                      Get Id In                  ${endpoint}                     ${id}
    Set Test Variable                ${RESPONSE}
    Log                              ${RESPONSE}

Send the POST request
    [Arguments]                      ${endpoint}                ${body}
    ${RESPONSE}                      Post in                    ${endpoint}     ${body}
    Set Test Variable                ${RESPONSE}
    ${id_exists}=                    Evaluate                   "id" in ${RESPONSE.json()}
    IF    ${id_exists}
        Set Test Variable            ${id}                      ${RESPONSE.json()}[id]
        Log                          ID is present: ${id}
    ELSE
        Set Test Variable            ${id}                      None
        Log                          ID not present in the response
    END
    Log                              ${RESPONSE.json()}
    Log                              ${id}

Send the PUT request
    [Arguments]                      ${endpoint}                ${body}
    ${RESPONSE}                      Put in                     ${endpoint}           ${body}      ${id}
    Set Test Variable                ${RESPONSE}
    ${id_exists}=                    Evaluate                   "id" in ${RESPONSE.json()}
    IF    ${id_exists}
        Set Test Variable            ${id}                      ${RESPONSE.json()}[id]
        Log                          ID is present: ${id}
    ELSE
        Set Test Variable            ${id}                      None
        Log                          ID not present in the response
    END
    Log                              ${RESPONSE.json()}
    Log                              ${id}

Send the DELETE request
    [Arguments]                      ${endpoint}                ${id}
    ${RESPONSE}                      Delete Id In               ${endpoint}    ${id}
    Set Test Variable                ${RESPONSE}
    Log                              ${RESPONSE.json()}

Validate message
    [Arguments]                      ${message}
    Should Be Equal As Strings       ${RESPONSE.json()}[message]              ${message}
    Log                              ${RESPONSE.json()}[message]

Validate error message
    [Arguments]    ${message}
    Should Be Equal As Strings       ${RESPONSE.json()}[error]                ${message}
    Log                              ${RESPONSE.json()}[error]

Validate message errors
    [Arguments]    ${message}
    Should Be Equal As Strings       ${RESPONSE.json()}[errors][0][msg]       ${message}
    Log                              ${RESPONSE.json()}[errors][0][msg]

Validate message errors 2
    [Arguments]    ${message}
    Should Be Equal As Strings       ${RESPONSE.json()}[errors][1][msg]       ${message}
    Log                              ${RESPONSE.json()}[errors][1][msg]

Validate the messages errors
    [Arguments]    ${message}        ${message1}  
    Should Be Equal As Strings       ${RESPONSE.json()}[errors][0][msg]       ${message}
    Should Be Equal As Strings       ${RESPONSE.json()}[errors][1][msg]       ${message1}
    Log                              ${RESPONSE.json()}[errors][0][msg]
    Log                              ${RESPONSE.json()}[errors][1][msg]