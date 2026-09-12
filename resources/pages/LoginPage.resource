*** Settings ***
Documentation     Ações e elementos da pagina de login

Library           Browser

*** Keywords ***
Submit login form
    [Arguments]    ${email}    ${password}

    Fill Text    css=input[placeholder$=mail]    ${email}