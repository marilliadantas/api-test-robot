*** Settings ***
Resource               ../config/package.robot

*** Keywords ***
Create Login Body
    [Arguments]        ${username}                  ${password}
    ${LOGIN_BODY}=     Create Dictionary
    IF                 "${username}" != 'None'      Set To Dictionary    ${LOGIN_BODY}      username        ${username}  
    IF                 "${password}" != "None"      Set To Dictionary    ${LOGIN_BODY}      password        ${password}   
    RETURN             ${LOGIN_BODY}

Create New Users Body
    [Arguments]        ${name}                      ${last_name}         ${email}
    ${USERS}=          Create Dictionary
    Run Keyword If     "${name}" != 'None'          Set To Dictionary    ${USERS}           name            ${name}
    Run Keyword If     "${last_name}" != 'None'     Set To Dictionary    ${USERS}           last_name       ${last_name}
    Run Keyword If     "${email}" != 'None'         Set To Dictionary    ${USERS}           email           ${email}
    RETURN             ${USERS}

Create New Crud Body
    [Arguments]        ${nome}                      ${email}             ${idade}          ${telefone}     ${endereco}    
    ...                ${profissao}                 ${empresa}
    ${CRUD}=           Create Dictionary
    Run Keyword If     "${nome}" != 'None'          Set To Dictionary    ${CRUD}            nome            ${nome}
    Run Keyword If     "${email}" != 'None'         Set To Dictionary    ${CRUD}            email           ${email}
    Run Keyword If     "${idade}" != 'None'         Set To Dictionary    ${CRUD}            idade           ${idade}
    Run Keyword If     "${telefone}" != 'None'      Set To Dictionary    ${CRUD}            telefone        ${telefone}
    Run Keyword If     "${endereco}" != 'None'      Set To Dictionary    ${CRUD}            endereco        ${endereco}
    Run Keyword If     "${profissao}" != 'None'     Set To Dictionary    ${CRUD}            profissao       ${profissao}
    Run Keyword If     "${empresa}" != 'None'       Set To Dictionary    ${CRUD}            empresa         ${empresa}
    RETURN             ${CRUD}