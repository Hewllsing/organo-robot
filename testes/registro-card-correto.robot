*** Settings ***
Resource         ../resources/main.robot
Test Setup       Dado que eu acesse o Organo
Test Teardown    Fechar o navegador


*** Test Cases ***

Verificar se ao preencher corretamente o formulário os dados são inseridos corretamente na lista e se um novo card é criado no time esperado
     Dado que preencha os campos do formulário
     E clique no botão criar card
     Então identificar o card no time esperado

     Sleep    10s

Verificar se é possivel criar mais de um card se preenchermos os campos corretamente
     Dado que preencha os campos do formulário
     E clique no botão criar card
     Então identificar 3 cards no time esperado
     
     Sleep    10s

Verificar se é possível criar um card para cada time se preenchermos os campos corretamente
    Dado que preencha os campos do formulário
    Entao criar e identificar 1 card em cada time disponível

    Sleep    10s



 