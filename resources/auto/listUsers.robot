*** Settings ***
Resource    ../../resources/config/package.robot

*** Keywords ***
Send the GET request
    ${RESPOSTA}    Get in     /users
    Set Global Variable       ${RESPOSTA}
    Log                       ${RESPOSTA.json()}

Validate the contract
    Validate Jsonschema From File     ${RESPOSTA.json()}       ${SCHEMA_FILE}