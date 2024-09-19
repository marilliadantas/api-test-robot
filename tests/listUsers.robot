*** Settings ***
Resource            ../resources/config/services.robot
Suite Setup         Connect api   /login

*** Test Cases ***
CT01: List users         
    Send the GET request
    Validate the contract     ${SCHEMA_USERS}   

CT02: list user by ID
    Send the GET request by ID    4
    Validate the contract     ${SCHEMA_USERSID}