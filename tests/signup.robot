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

    Alert should be    Informe seu nome completo
    Alert should be    Informe seu e-email
    Alert should be    Informe uma senha com pelo menos 6 digitos

Não deve cadastrar com email incorreto
   [Tags]    inv_email
  
   ${user}    Create Dictionary
   ...    name=Juma Rodrigues   email=glenda.com.br   password=gl123456

   Go to signup page
   Submit signup form    ${user}
   Alert should be    Digite um e-mail válido

Não deve cadastrar com senha de 1 digito
    [Tags]    short_pass
    [Template]
    Short password    1

Não deve cadastrar com senha de 2 digitos
    [Tags]    short_pass
    [Template]
    Short password    12

Não deve cadastrar com senha de 3 digitos
    [Tags]    short_pass
    [Template]
    Short password    123

Não deve cadastrar com senha de 4 digitos
    [Tags]    short_pass
    [Template]
    Short password    1234

Não deve cadastrar com senha de 5 digitos
    [Tags]    short_pass
    [Template]
    Short password    12345 

*** Keywords ***
Short password
   [Arguments]    ${short_pass}

   ${user}    Create Dictionary
   ...    name=Glenda test   email=test@glenda.com   password=${short_pass}
    
    Go to signup page
    Submit signup form    ${user}

    Alert should be    Informe uma senha com pelo menos 6 digitos