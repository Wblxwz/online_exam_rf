
*** Settings ***

Documentation    test for online exam
Resource    ../resources/Keywords.resource

*** Variables ***
${url}    http://localhost:8080

*** Test Cases ***

# Hello
#     ${hi}   Set Variable    hello world!
#     Log    message=${hi}

LoginStudent
    [Documentation]    学生登录
    [Tags]    login    student    p1
    Login    url=${url}    username=2    password=2   
    ${location}    Get Location
    Log    message=${location}
    TRY
        Wait Until Location Is    expected=${url}/studentHome    timeout=3    message=学生登录失败
    EXCEPT
        Close Browser
        Fail    msg=学生登录失败
    END
    Log    message='student log in'
    Close Browser
LoginTeacher
    [Documentation]    教师登录
    [Tags]    login    teacher    p1
    Login    url=${url}    username=1    password=1    
    ${location}    Get Location
    Log    message=${location}
    TRY
        Wait Until Location Is   expected=${url}/teacherManage/teacherHome    timeout=3    message=教师登录失败
    EXCEPT
        Close Browser
        Fail    msg=教师登录失败
    END
    Log    message='teacher log in'
    Close Browser
LoginRoot
    [Documentation]    管理员登录
    [Tags]    login    root    p1
    Login    url=${url}    username=root    password=root
    ${location}    Get Location
    Log    message=${location}
    TRY
        Wait Until Location Is    expected=${url}/managerHome?uid=MjE=&role=MA==    timeout=3    message=管理员登录失败
    EXCEPT
        Close Browser
        Fail    msg=管理员登录失败
    END
    Log    message='root log in'
    Close Browser
