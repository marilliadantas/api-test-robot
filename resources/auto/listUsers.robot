*** Settings ***
Resource    ../../resources/config/package.robot

*** Keywords ***
Send the GET request
    ${RESPOSTA}    Get in     /users
    Set Global Variable       ${RESPOSTA}
    Log                       ${RESPOSTA.json()}

Validate the contract
    [Arguments]       ${schema}
    Validate Jsonschema From File     ${RESPOSTA.json()}       ${schema}

Send the GET request by ID
    [Arguments]       ${id}
    ${RESPOSTA}       Get Id In     /produtos                       ${id}
    Set Test Variable               ${RESPOSTA}
    Log                             ${RESPOSTA}