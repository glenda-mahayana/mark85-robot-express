*** Settings ***
Documentation     Cenarios de teste do cadastro de usuario
Resource          ../resources/base.robot
library           FakerLibrary

*** Test Cases ***
Deve poder cadastrar um novo usuario
   ${name}=    FakerLibrary.Name
   ${email}=    FakerLibrary.Email
   ${password}=    Set Variable    glenda123456

   Start Session
   Go To    http://localhost:3000/signup

#Checkpoint
   Wait For Elements State    css=h1   visible    5
   Get Text    css=h1    equal    Faça seu cadastro

   Fill Text    id=name    ${name}
   Fill Text    id=email    ${email}
   Fill Text    id=password    ${password}
   
   Click    id=buttonSignup
   
   Wait For Elements State    css=.notice p   visible    5
   Get Text    css=.notice p    equal    Boas vindas ao Mark85, o seu gerenciador de tarefas.    

