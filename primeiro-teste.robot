*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Abrir navegador e acessar o site do organo
    Open Browser    url=http://localhost:3000/    browser=Chrome

Preencher os campos do formulario e adicionar novo colaborador
    Input Text    id:form-nome      Yousek
    Input Text    id:form-cargo     Desenvolvedor
    Input Text    id:form-imagem    https://picsum.photos/200/300
    Click Element    class:lista-suspensa
    Click Element    //option[contains(.,'Programação')]
    Sleep    5s
    Click Element    id:form-botao
    Element Should Be Visible    class:colaborador
    Sleep    5s 