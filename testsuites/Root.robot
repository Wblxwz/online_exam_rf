*** Settings ***

Documentation    管理员测试用例集
Resource    Keywords.resource

*** Test Cases ***

LoginRoot
    [Documentation]    管理员登录
    [Tags]    login    root    p1
    Login    url=${url}    username=root    password=root    check_url=${url}/managerHome?uid=MjE=&role=MA==
    Element Should Contain    locator=xpath=/html/body/div[1]/div/section/section/aside/ul/li[1]    expected=主页
    Element Should Contain    locator=xpath=/html/body/div[1]/div/section/section/aside/ul/li[2]    expected=班级管理
    Element Should Contain    locator=xpath=/html/body/div[1]/div/section/section/aside/ul/li[3]    expected=考试管理
    Element Should Contain    locator=xpath=/html/body/div[1]/div/section/section/aside/ul/li[4]    expected=试卷管理
    Element Should Contain    locator=xpath=/html/body/div[1]/div/section/section/aside/ul/li[5]    expected=题库管理
    Element Should Contain    locator=xpath=/html/body/div[1]/div/section/section/aside/ul/li[6]    expected=用户管理
    Capture Page Screenshot    filename=${OUTPUTDIR}/root_login.png
    File Should Exist    path=${OUTPUT_DIR}/root_login.png    msg=管理员主页截图失败
    Close Browser