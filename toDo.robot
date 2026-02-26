*** Settings ***
Library        SeleniumLibrary


*** Variables ***
${campoToDo}             id:todo-input
@{lista3Itens}           Fazer Compras    Colocar Gasolina    Lavar o Carro
@{lista4Itens}           Fazer Compras    Colocar Gasolina    Lavar o Carro    Jogar PS5

*** Test Cases ***

Cenário 01 acessar o site do To-do adicionar 3 atividades completar a atividade 2 e filtrar por atividades concluidas
    Dado que eu acesse o To-Do
    E adicione três atividades
    E conclua a segunda atividade
    Então filtre as atividades concluidas

Cenário 02 acessar o site do To-do adicionar 4 atividades completar a atividade 3 e filtrar por atividades concluidas

    Dado que eu acesse o To-Do
    E adicione quatro Atividades
    E conclua a terceira atividade
    E delete a terceira atividade
    Então filtre as atividades concluidas

Cenário 03 acessar o site do To-do adicionar 4 atividades completar a atividade 4 e limpar as atividades concluidas

    Dado que eu acesse o To-Do
    E adicione quatro Atividades
    E conclua a quarta atividade
    Então limpe as atividades concluidas


*** Keywords ***

Dado que eu acesse o To-Do
    Open Browser   url=https://todomvc.com/examples/react/dist/  browser=Chrome
    Maximize Browser Window

Atualiza navegador para proximo cenário
    Reload Page

E adicione três atividades
       FOR    ${itens}    IN    @{lista3Itens}
           Input Text        ${campoToDo}        ${itens}
           Press Keys        ${campoToDo}        ENTER
           Sleep    3S
       END

E adicione quatro atividades
       FOR    ${itens}    IN    @{lista4Itens}
           Input Text        ${campoToDo}        ${itens}
           Press Keys        ${campoToDo}        ENTER
           Sleep    3S
       END

E conclua a segunda atividade
    Select Checkbox        xpath=/html/body/section/main/ul/li[2]/div/input
    Sleep    5s

Então filtre as atividades concluidas
    Click Link             xpath=//*[@id="root"]/footer/ul/li[3]/a
    Sleep    5s

E conclua a terceira atividade
    Select Checkbox        xpath=/html/body/section/main/ul/li[3]/div/input
    Sleep    5s

E conclua a quarta atividade
    Select Checkbox        xpath=/html/body/section/main/ul/li[4]/div/input
    Sleep    5s

E delete a terceira atividade
    Click Button           xpath=/html/body/section/main/ul/li[3]/div/button
    Sleep    5s

Então limpe as atividades concluidas
    Click Button             xpath=/html/body/section/footer/button
    Sleep    5s