*** Settings ***
Resource    ../resources/config/services.robot
Suite Setup         Connect api   /login

*** Test Cases ***
CT01: Login - Success             
    Enter username and password        admin     password
    API should return status code      201