*** Settings ***
Documentation     Cenarios de teste autenticação do usuario

Resource          ../resources/base.resource
Library    Collections

Test Setup        Start Session
Test Teardown     Take Screenshot

*** Test Cases ***
Deve poder logar com um usuario pre-cadastrado
    ${user}    Create Dictionary    
    ...    name=Glenda Rodrigues 
    ...    email=grodrigues@test.com 
    ...    password=glenda123456

    Remove user from database    ${user}[email]
    Insert user from database    ${user}

    Submit login form    ${user}
    User should be logged in    ${user}[name]


Não deve logar com senha invalida
    ${user}    Create Dictionary    
    ...    name=Gabriel Rodrigues 
    ...    email=gabrielrodrigues@test.com 
    ...    password=gabs123456

    Remove user from database    ${user}[email]
    Insert user from database    ${user}

    Set To Dictionary    ${user}    password=abc123

    Submit login form    ${user}
    Notice should be    Ocorreu um erro ao fazer login, verifique suas credenciais.
