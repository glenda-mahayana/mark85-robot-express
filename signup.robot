*** Settings ***
Documentation     Cenarios de teste do cadastro de usuario
Library           Browser

*** Test Cases ***
Deve poder cadastrar um novo usuario
   New Browser    browser=chromium    headless=False
   New Page    http://localhost:3000/signup

#Checkpoint
   Wait For Elements State    css=h1   visible    5
   Get Text    css=h1    equal    Faça seu cadastro

   Fill Text    id=name    Glenda Silva
   Fill Text    id=email    glenda.silva@example.com
   Fill Text    id=password    glenda123456

   Click    id=buttonSignup