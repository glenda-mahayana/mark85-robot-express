*** Settings ***
Documentation     Cenarios de teste do cadastro de usuario

Resource          ../resources/base.robot
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

   Go To    ${BASE_URL}/signup

#Checkpoint
   Wait For Elements State    css=h1   visible    5
   Get Text    css=h1    equal    Faça seu cadastro

   Fill Text    id=name    ${user}[name]
   Fill Text    id=email    ${user}[email]
   Fill Text    id=password    ${user}[password]
   
   Click    id=buttonSignup
   
   Wait For Elements State    css=.notice p   visible    5
   Get Text    css=.notice p    equal    Boas vindas ao Mark85, o seu gerenciador de tarefas.  

    

Não deve permitir cadastrar usuario com email duplicado
    [tags]    dup

    ${user}    Create Dictionary    
   ...    name=Glenda Rodrigues    email=glenda@test.com    password=glenda123456

   Remove user from database    ${user}[email]
   Insert user from database    ${user}

   Go To    ${BASE_URL}/signup

   Wait For Elements State    css=h1   visible    5
   Get Text    css=h1    equal    Faça seu cadastro

   Fill Text    id=name    ${user}[name]
   Fill Text    id=email    ${user}[email]   
   Fill Text    id=password    ${user}[password]
   
   Click    id=buttonSignup

   Wait For Elements State    css=.notice p   visible    5
   Get Text    css=.notice p    equal    Oops! Já existe uma conta com o e-mail informado.

