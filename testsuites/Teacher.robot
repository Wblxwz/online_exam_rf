*** Settings ***

Documentation    教师测试用例集
Resource    Keywords.resource

*** Variables ***
${class_name}=    cs
${class_code}=    cs111
${page}=    1

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

AddClass
    [Documentation]    教师添加班级
    [Tags]    addclass    teacher    p1
    ${response}=    GET    url=${api_url}/classCount/17
    ${class_count}=    Set Variable    ${response.json()}
    Login    url=${url}    username=1    password=1    check_url=${url}/teacherManage/teacherHome
    Click Element    locator=xpath=/html/body/div[1]/div/section/section/aside/ul/li[2]
    Wait Until Element Is Visible    locator=xpath=/html/body/div[1]/div/section/section/main/div[1]/button    timeout=3    error=添加班级按钮不可见
    Click Button    locator=xpath=/html/body/div[1]/div/section/section/main/div[1]/button
    Wait Until Element Is Visible    locator=xpath=/html/body/div[1]/div/section/section/main/div[2]/div[4]/div/div/div/div[2]/button[2]    timeout=3    error=添加班级确认按钮不可见
    Input Text    locator=xpath=/html/body/div[1]/div/section/section/main/div[2]/div[4]/div/div/div/div[1]/div[1]/div/input    text=${class_name}
    Input Text    locator=xpath=/html/body/div[1]/div/section/section/main/div[2]/div[4]/div/div/div/div[1]/div[2]/div/input    text=${class_code}
    Click Button    locator=xpath=/html/body/div[1]/div/section/section/main/div[2]/div[4]/div/div/div/div[2]/button[2]
    IF    ${class_count} >= 10
        ${page}=    Evaluate    math.floor(${class_count} / 10) + 1
    END
    IF    ${page} > 1
        Wait Until Element Is Visible    locator=xpath=/html/body/div[1]/div/section/section/main/div[2]/div[2]/div/ul/li[${page}]    timeout=3    error=页面按钮不可见
        Click Element    locator=xpath=/html/body/div[1]/div/section/section/main/div[2]/div[2]/div/ul/li[${page}]         
    END
    Wait Until Page Contains    text=${class_code}    timeout=3    error=创建班级失败
    Capture Page Screenshot    filename=${OUTPUTDIR}/teacher_add_class.png
    Close Browser
    ${after_response}=    GET    url=${api_url}/classCount/17
    ${after_class_count}=    Set Variable    ${after_response.json()}
    IF    ${after_class_count} == ${class_count}
        Fail    msg='添加班级失败，请查看截图'
    END
    
