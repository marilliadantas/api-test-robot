*** Settings ***
Resource            ../resources/config/services.robot
Suite Setup         Connect api   /login

*** Test Cases ***
CT01: List users         
    Send the GET request
    Validate the contract