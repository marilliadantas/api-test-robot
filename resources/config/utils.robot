*** Settings ***
Resource        package.robot

*** Variables ***
${FakeFirstname}
${FakeLastname}
${FakeFullname}
${FakeEmail}
${FakeSenha}
${FakerDescricao}
${FakerValor}

*** Keywords ***
Fakers

#FakerFullname
    ${FakeFullname}=         FakerLibrary.Name
    Set Test Variable        ${FakeFirstname}

#FakerFirstname
    ${FakeFirstname}=        FakerLibrary.First Name
    Set Test Variable        ${FakeFirstname}

#FakerLastname
    ${FakeLastname}=         FakerLibrary.Last Name
    Set Test Variable        ${FakeLastname}

#FakerEmail
    ${FakeEmail}=            FakerLibrary.Email
    Set Test Variable        ${FakeEmail}

#FakerSenha
    ${compSenha}=            FakerLibrary.Numerify      text=##
    ${FakeSenha}=            Catenate     Seubarriga    ${compSenha}
    Set Test Variable        ${FakeSenha}

#FakerDescrição
    ${FakerDescricao}=       FakerLibrary.Sentence
    Set Test Variable        ${FakerDescricao}

#FakerValor
    ${FakerValor}=           FakerLibrary.Numerify    ###
    Set Test Variable        ${FakerValor}