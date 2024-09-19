*** Settings ***
Documentation    Este é o gerenciador de dependências da automação

Library      RequestsLibrary
Library      JsonValidator
Library      Collections
Library      String
Library      BuiltIn

Resource     services.robot
Resource     ../auto/login.robot
Resource     ../auto/listUsers.robot