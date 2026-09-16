*** Settings ***
Documentation    Ações e elementos da pagina de cadastro de tarefas

Library    Browser

*** Keywords ***
Submit task form
    [Arguments]    ${task}

    Fill Text    css=input[placeholder$=tarefa]    ${task}[name]

    FOR    ${tag}    IN     @{task}[tags]
            Fill Text    css=input[name=tags]    ${task}[tags]
    END
    
    Click    css=button >> text=Cadastrar