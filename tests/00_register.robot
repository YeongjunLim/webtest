*** Settings ***
Suite Setup       setup
Test Setup        New Page    https://demoqa.com/register
Test Teardown     Close Page
Library           Browser
Variables         ../config.py
Resource          ../common_library.robot

*** Test Cases ***
TC-register-01
    [Documentation]    모든 필드를 비우고 가입 시도 시 테두리가 빨간색으로 변하는지 확인합니다.
    Scroll To Element    id=register
    Click    id=register
    # 필수 필드들이 'is-invalid' 클래스를 가지는지 확인 (CSS 검증)
    ${first_name_class}    Get Attribute    id=firstname    class
    Should Contain    ${first_name_class}    is-invalid
    ${last_name_class}    Get Attribute    id=lastname    class
    Should Contain    ${last_name_class}    is-invalid

TC-register-02
    [Documentation]    복잡성 규칙(대문자, 특수문자 등)에 어긋나는 비밀번호 입력 시 반응을 확인합니다.
    ${userName}=    Set Variable    new_auto_user_01
    ${password}=    Set Variable    weakpassword123
    Fill Text    id=firstname    YoungJun
    Fill Text    id=lastname    Lim
    Fill Text    id=userName    ${userName}
    Fill Text    id=password    ${password}
    # 가입 버튼 클릭
    Click    id=register
    # 캡차 미체크 혹은 비밀번호 규칙 위반으로 인해 페이지가 넘어가지 않아야 함
    Wait For Condition    url    contains    /register
    Log    Form submitted but stayed on register page due to validation/captcha.

TC-register-03
    [Documentation]    캡차를 체크하지 않았을 때의 상태를 확인합니다.
    ${userName}=    Set Variable    new_auto_user_03
    ${password}=    Set Variable    Test1234!
    Fill Text    id=firstname    YoungJun
    Fill Text    id=lastname    Lim
    Fill Text    id=userName    ${userName}
    Fill Text    id=password    ${password}
    Click    id=register
    # 캡차 영역(iframe) 주위에 에러 표시가 생기는지 확인
    Wait For Elements State    id=name    visible
    Get Text    id=name    ==    Please verify reCaptcha to register!

TC-register-04
    [Documentation]    회원가입 페이지에서 로그인 페이지로 정상적으로 돌아가는지 확인합니다.
    Click    id=gotologin
    Wait For Condition    url    contains    /login
    Get Text    .text-center    ==    Login
