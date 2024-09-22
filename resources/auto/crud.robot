*** Settings ***
Resource                             ../../resources/config/package.robot

*** Keywords ***
    
Create Crud
    [Arguments]                      ${nome}                  ${email}          ${idade}         ${telefone}    
    ...                              ${endereco}              ${profissao}      ${empresa}   
    ${CRUD_BODY}                     Create New Crud Body     ${nome}           ${email}          ${idade}        ${telefone}    
    ...                              ${endereco}              ${profissao}      ${empresa}
    Set Test Variable                ${CRUD_BODY}
    Log                              ${CRUD_BODY}

Validate values crud
    [Arguments]                      ${nome}                  ${email}          ${idade}         ${telefone}    
    ...                              ${endereco}              ${profissao}      ${empresa}
    Should Be Equal As Strings       ${nome}                  ${RESPONSE.json()}[nome]
    Should Be Equal As Strings       ${email}                 ${RESPONSE.json()}[email]
    Should Be Equal As Integers      ${idade}                 ${RESPONSE.json()}[idade]
    Should Be Equal As Strings       ${telefone}              ${RESPONSE.json()}[telefone]
    Should Be Equal As Strings       ${endereco}              ${RESPONSE.json()}[endereco]
    Should Be Equal As Strings       ${profissao}             ${RESPONSE.json()}[profissao]
    Should Be Equal As Strings       ${empresa}               ${RESPONSE.json()}[empresa]