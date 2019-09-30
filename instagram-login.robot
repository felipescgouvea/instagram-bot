*** Settings ***
Documentation     Define a way to login on Instagram
Library           SeleniumLibrary
Resource          credentials.robot
*** Variables ***
${LOGIN URL}        https://www.instagram.com/accounts/login/?source=auth_switcher
${BROWSER}          Chrome

*** Keywords ***
Login On Instagram
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Input Text      username        ${USERNAME}
    Input Text      password        ${PASSWORD} 
    Click Element    css:[type="submit"]
    Deactivate Notification

Deactivate Notification
    Wait Until Element Is Visible       css:.aOOlW.bIiDR
    Click Element       css:.aOOlW.bIiDR