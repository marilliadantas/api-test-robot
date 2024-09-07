*** Settings ***
Resource    ../../resources/config/package.robot

*** Keywords ***
Send the GET request
    ${RESPONSE}    Get in     /users
    Set Global Variable       ${RESPONSE}
    Log                       ${RESPONSE.json()}

Validate the contract
    [Arguments]       ${schema}
    Validate Jsonschema From File     ${RESPONSE.json()}       ${schema}

Send the GET request by ID
    [Arguments]       ${id}
    ${RESPONSE}       Get Id In     /users                       ${id}
    Set Test Variable               ${RESPONSE}
    Log                             ${RESPONSE}