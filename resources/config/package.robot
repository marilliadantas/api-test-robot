*** Settings ***
Documentation    Este é o gerenciador de dependências da automação

Library      RequestsLibrary
Library      JsonValidator

Resource     services.robot
Resource     ../auto/login.robot
Resource     ../auto/listarUsuarios.robot