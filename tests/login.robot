*** Settings ***
Documentation     Cenarios de teste autenticação do usuario

Resource          ../resources/base.resource

Test Setup        Start Session
Test Teardown     Take Screenshot

*** Test Cases ***
Deve poder logar com um usuario pre-cadastrado
    ${user}    Create Dictionary    name=Glenda Rodrigues email=glenda@test.com password=glenda123456