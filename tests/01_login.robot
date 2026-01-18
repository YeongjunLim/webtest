*** Settings ***
Suite Setup       setup
Test Setup        New Page    https://demoqa.com/login
Test Teardown     Close Page
Library           Browser
Variables         ../config.py
Resource          ../common_library.robot

*** Test Cases ***
TC-login-01
    [Documentation]    성공적인 로그인 후 프로필 페이지로 이동하는지 확인합니다.
    Login    ${userName}    ${password}
    # URL이 profile로 변경되었는지, 사용자 이름이 맞는지 검증
    Wait For Condition    url    contains    /profile
    Get Text    id=userName-value    ==    ${userName}

TC-login-02
    [Documentation]    아이디는 맞지만 비밀번호가 틀린 경우 에러 메시지를 확인합니다.
    ${invalid_pw}=    Set Variable    WrongPass123!
    Login    ${userName}    ${invalid_pw}
    # 에러 메시지 노출 및 텍스트 검증
    Wait For Elements State    id=name    visible
    Get Text    id=name    ==    Invalid username or password!

TC-login-03
    [Documentation]    존재하지 않는 아이디로 로그인 시도 시 에러를 확인합니다.
    ${NON_EXIST_ID}=    Set Variable    ghost_user_99
    Login    ${NON_EXIST_ID}    ${password}
    Get Text    id=name    ==    Invalid username or password!

TC-login-04
    [Documentation]    필수 입력 필드를 비우고 로그인 시 테두리 색상(에러 클래스) 변화를 확인합니다.
    # 아무것도 입력하지 않고 클릭
    Click    id=login
    # Playwright의 'Get Attribute'를 이용해 입력창에 'is-invalid' 클래스가 생겼는지 확인
    # (DemoQA는 에러 시 CSS 클래스를 통해 빨간 테두리를 표시함)
    ${user_class}    Get Attribute    id=userName    class
    Should Contain    ${user_class}    is-invalid

TC-login-05
    [Documentation]    로그인 후 로그아웃 버튼을 눌러 다시 로그인 페이지로 돌아오는지 확인합니다.
    # 로그인 먼저 수행
    Login    ${userName}    ${password}
    # Profile 페이지에서 로그아웃 클릭
    Click    text="Log out"
    # 다시 로그인 페이지로 돌아왔는지 검증
    Wait For Condition    url    contains    /login
    Wait For Elements State    id=login    visible
