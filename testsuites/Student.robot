
*** Settings ***

Documentation    学生测试用例集
Resource    ../resources/Keywords.resource

*** Test Cases ***

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
