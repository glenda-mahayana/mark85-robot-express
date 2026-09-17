*** Settings ***
Documentation    Consumindo a API REST do sistema mark85

Library    RequestsLibrary

*** Keywords ***
POST a new task
    [Arguments]    ${payload}
    POST    url=http://localhost:3333/tasks
    ...     json=${payload}
    ...     expected_status=201