*** Settings ***

Documentation    教师测试用例集
Resource    Keywords.resource

*** Test Cases ***

LoginTeacher
    [Documentation]    教师登录
    [Tags]    login    teacher    p1
    Login    url=${url}    username=1    password=1    check_url=${url}/teacherManage/teacherHome
    Element Should Contain    locator=xpath=/html/body/div[1]/div/section/section/aside/ul/li[1]    expected=主页
    Element Should Contain    locator=xpath=/html/body/div[1]/div/section/section/aside/ul/li[2]    expected=班级
    Element Should Contain    locator=xpath=/html/body/div[1]/div/section/section/aside/ul/li[3]    expected=考试
    Element Should Contain    locator=xpath=/html/body/div[1]/div/section/section/aside/ul/li[4]    expected=试卷
    Element Should Contain    locator=xpath=/html/body/div[1]/div/section/section/aside/ul/li[5]    expected=题库
    Element Should Contain    locator=xpath=/html/body/div[1]/div/section/section/aside/ul/li[6]    expected=设置
    Capture Page Screenshot    filename=${OUTPUTDIR}/teacher_login.png
    File Should Exist    path=${OUTPUT_DIR}/teacher_login.png    msg=教师主页截图失败
    Close Browser


