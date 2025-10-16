*** Settings ***

Documentation    教师测试用例集
Resource    Keywords.resource

*** Test Cases ***

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
    Capture Page Screenshot    filename=${OUTPUTDIR}/teacher_login.png
    File Should Exist    path=${OUTPUT_DIR}/teacher_login.png    msg=教师主页截图失败
    Close Browser

