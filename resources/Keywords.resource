
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    http://localhost:8080

*** Keywords ***
Login
    [Arguments]    ${url}    ${username}    ${password}
    Open Browser    ${url}    browser=Edge
    Input Text    locator=xpath=/html/body/div/div/div/section/main/div/div[1]/div/div/input    text=${username}
    Input Password    locator=xpath=/html/body/div/div/div/section/main/div/div[2]/div/div/input    password=${password}
    Click Button    locator=xpath=/html/body/div/div/div/section/main/div/div[4]/button
