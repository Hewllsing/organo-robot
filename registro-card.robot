*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CAMPO_NOME}      id:form-nome
${CAMPO_CARGO}     id:form-cargo
${CAMPO_IMAGEM}    id:form-imagem
${CAMPO_TIME}      class:lista-suspensa
${CAMPO_CARD}      id:form-botao 
${PROGRAMACAO}     //option[contains(.,'Programação')]
${FRONT-END}       //option[contains(.,'Front-End')]
${DADOS}           //option[contains(.,'Data Science')]
${DEVOPS}          //option[contains(.,'Devops')]
${UX}              //option[contains(.,'UX e Design')]
${MOBILE}          //option[contains(.,'Mobile')]
${INOVACAO}        //option[contains(.,'Inovação')]

*** Test Cases ***

Verificar se ao preencher corretamente o formulário os dados são inseridos corretamente na lista e se um novo card é criado no time esperado
     Dado que eu acesse o Organo
     E preencha os campos do formulário
     E clique no botão criar card
     Então identificar o card no time esperado

*** Keywords ***

Dado que eu acesse o Organo
    Open Browser    url=http://localhost:3000/    browser=Chrome

E preencha os campos do formulário
    Input Text       ${CAMPO_NOME}       Akemi
    Input Text       ${CAMPO_CARGO}      Desenvolvedora 
    Input Text       ${CAMPO_IMAGEM}     https://picsum.photos/200/300
    Click Element    ${CAMPO_TIME}
    Click Element    ${PROGRAMACAO}

E clique no botão criar card    
    Click Element    ${CAMPO_CARD}

Então identificar o card no time esperado
    Element Should Be Visible    class:colaborador