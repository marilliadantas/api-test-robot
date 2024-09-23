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
    [Arguments]        ${name}                      ${email}             ${age}          ${phone}     ${address}    
    ...                ${profession}                ${company}
    ${CRUD}=           Create Dictionary
    Run Keyword If     "${name}" != 'None'          Set To Dictionary    ${CRUD}            nome            ${name}
    Run Keyword If     "${email}" != 'None'         Set To Dictionary    ${CRUD}            email           ${email}
    Run Keyword If     "${age}" != 'None'           Set To Dictionary    ${CRUD}            idade           ${age}
    Run Keyword If     "${phone}" != 'None'         Set To Dictionary    ${CRUD}            telefone        ${phone}
    Run Keyword If     "${address}" != 'None'       Set To Dictionary    ${CRUD}            endereco        ${address}
    Run Keyword If     "${profession}" != 'None'    Set To Dictionary    ${CRUD}            profissao       ${profession}
    Run Keyword If     "${company}" != 'None'       Set To Dictionary    ${CRUD}            empresa         ${company}
    RETURN             ${CRUD}