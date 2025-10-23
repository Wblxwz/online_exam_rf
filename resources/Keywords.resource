
*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    RequestsLibrary

*** Variables ***
${url}    http://localhost:8080
${api_url}    http://localhost:7000

*** Keywords ***
Login
    [Arguments]    ${url}    ${username}    ${password}    ${check_url}
    Open Browser    ${url}    browser=Edge
    Maximize Browser Window
    Input Text    locator=xpath=/html/body/div/div/div/section/main/div/div[1]/div/div/input    text=${username}
    Input Password    locator=xpath=/html/body/div/div/div/section/main/div/div[2]/div/div/input    password=${password}
    Click Button    locator=xpath=/html/body/div/div/div/section/main/div/div[4]/button
    ${location}    Get Location
    Log    message=${location}
    TRY
        Wait Until Location Is   expected=${check_url}    timeout=3    message=${username}登录失败
    EXCEPT
        Close Browser
        Fail    msg=${username}登录失败
    END
    Log    message='${username} login'
