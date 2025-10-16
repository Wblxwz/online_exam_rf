*** Settings ***

Documentation    管理员测试用例集
Resource    Keywords.resource

*** Test Cases ***

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