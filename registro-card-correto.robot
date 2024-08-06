*** Settings ***
Library          SeleniumLibrary
Resource         setup-teardown.robot
Test Setup       Dado que eu acesse o Organo
Test Teardown    Fechar o navegador

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
     Dado que preencha os campos do formulário
     E clique no botão criar card
     Então identificar o card no time esperado

Verificar se é possivel criar mais de um card se preenchermos os campos corretamente
     Dado que preencha os campos do formulário
     E clique no botão criar card
     Então identificar 3 cards no time esperado

*** Keywords ***
Dado que preencha os campos do formulário
     Input Text       ${CAMPO_NOME}       Yousek
     Input Text       ${CAMPO_CARGO}      Desenvolvedor 
     Input Text       ${CAMPO_IMAGEM}     https://picsum.photos/200/300
     Click Element    ${CAMPO_TIME}
     Click Element    ${PROGRAMACAO}

E clique no botão criar card    
     Click Element    ${CAMPO_CARD}

Então identificar o card no time esperado
     Element Should Be Visible    class:colaborador

Então identificar 3 cards no time esperado
    FOR    ${i}    IN RANGE    1    3  
        Dado que preencha os campos do formulário
            E clique no botão criar card
        
    END

 