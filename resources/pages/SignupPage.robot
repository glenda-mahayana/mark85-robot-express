*** Settings ***
Documentation     Elementos e ações da pagina de cadastro

Library           Browser
Resource          ../env.robot

*** Keywords ***
Go to signup page
    Go To    ${BASE_URL}/signup

#Checkpoint
   Wait For Elements State    css=h1   visible    5
   Get Text    css=h1    equal    Faça seu cadastro

Submit signup form
   [Arguments]    ${user}

   Fill Text    id=name    ${user}[name]
   Fill Text    id=email    ${user}[email]
   Fill Text    id=password    ${user}[password]
   
   Click    id=buttonSignup

Notice should be
   [Arguments]    ${expected_text}

   Wait For Elements State    css=.notice p   visible    5
   Get Text    css=.notice p    equal    ${expected_text}
