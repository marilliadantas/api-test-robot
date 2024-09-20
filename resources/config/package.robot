*** Settings ***
Documentation    Este é o gerenciador de dependências da automação

Library      RequestsLibrary
Library      JsonValidator
Library      Collections
Library      String
Library      BuiltIn
Library      FakerLibrary

Resource     services.robot
Resource     ../auto/login.robot
Resource     ../auto/users.robot
Resource     ../factories/factories.robot
Resource     utils.robot