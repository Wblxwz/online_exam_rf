
*** Settings ***

Documentation    学生测试用例集
Resource    ../resources/Keywords.resource

*** Test Cases ***

LoginStudent
    [Documentation]    学生登录
    [Tags]    login    student    p1
    Login    url=${url}    username=2    password=2    check_url=${url}/studentHome
    Element Should Contain    locator=xpath=/html/body/div[1]/div/section/header/ul/li[2]    expected=首页
    Element Should Contain    locator=xpath=/html/body/div[1]/div/section/header/ul/li[3]    expected=班级
    Element Should Contain    locator=xpath=/html/body/div[1]/div/section/header/ul/li[4]    expected=考试
    Element Should Contain    locator=xpath=/html/body/div[1]/div/section/header/ul/li[5]    expected=错题
    Element Should Contain    locator=xpath=/html/body/div[1]/div/section/header/ul/li[6]    expected=设置
    Capture Page Screenshot    filename=${OUTPUTDIR}/student_login.png
    File Should Exist    path=${OUTPUT_DIR}/student_login.png    msg=学生主页截图失败
    Close Browser
