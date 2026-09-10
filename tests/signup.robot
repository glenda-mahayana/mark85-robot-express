*** Settings ***
Documentation     Cenarios de teste do cadastro de usuario

Resource          ../resources/base.resource
library           FakerLibrary

Suite Setup       Log    Tudo aqui acontece antes da Suite(antes de todos os testes)
Suite Teardown    Log    Tudo aqui acontece depois da Suite(depois de todos os testes)

Test Setup        Start Session
Test Teardown     Take Screenshot

*** Test Cases ***
Deve poder cadastrar um novo usuario
   ${user}    Create Dictionary    
   ...    name=Glenda Rodrigues    email=glenda@test.com    password=glenda123456

   Remove user from database    ${user}[email]

   Go to signup page
   Submit signup form    ${user}
   Notice should be   Boas vindas ao Mark85, o seu gerenciador de tarefas.

Não deve permitir cadastrar usuario com email duplicado
    [tags]    dup

    ${user}    Create Dictionary    
   ...    name=Glenda Rodrigues    email=glenda@test.com    password=glenda123456

   Remove user from database    ${user}[email]
   Insert user from database    ${user}

   Go to signup page
   Submit signup form    ${user}
   Notice should be   Oops! Já existe uma conta com o e-mail informado.

Campos obrigatorios
    [Tags]    required

   ${user}    Create Dictionary
   ...    name=${EMPTY}   email=${EMPTY}   password=${EMPTY}
    Go to signup page
    Submit signup form    ${user}