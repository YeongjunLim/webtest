*** Settings ***
Documentation     해당 페이지 기능동작을 하지 않아 스크립트 미작성
Suite Setup       New Browser    chromium    headless=True
Test Setup        New Page    https://demoqa.com/login
Test Teardown     Close Page
Library           Browser
Variables         ../config.py

*** Test Cases ***
TC-profile-01
    [Documentation]    로그아웃 상태에서 프로필 페이지 접근 시 로그인 페이지로 리다이렉트되는지 확인합니다.

TC-profile-02
    [Documentation]    로그인한 사용자의 정보와 도서 목록 테이블이 노출되는지 확인합니다.

TC-profile-03
    [Documentation]    서재에서 특정 책을 삭제하고 목록에서 사라졌는지 확인합니다.

TC-profile-04
    [Documentation]    'Delete All Books' 버튼 작동 시 모달이 뜨는지 확인합니다.

TC-profile-05
    [Documentation]    회원 탈퇴 버튼 클릭 시 경고 메시지가 정상적으로 노출되는지 확인합니다.

*** Keywords ***
Login
    [Arguments]    ${id}    ${pw}
    Fill Text    id=userName    ${id}
    Fill Text    id=password    ${pw}
    Click    id=login
