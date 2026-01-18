*** Settings ***
Suite Setup       New Browser    chromium    headless=True
Test Setup        New Page    https://demoqa.com/books
Test Teardown     Close Page
Library           Browser
Variables         ../config.py

*** Test Cases ***
TC-bookstore-01
    [Documentation]    페이지 진입 시 기본적으로 도서 목록이 로드되는지 확인합니다.
    # 테이블 내의 책 제목 링크가 최소 1개 이상 존재하는지 확인
    ${count}    Get Element Count    css=.rt-tr-group .action-buttons
    Should Be True    ${count} >= 1
    Log    Total books loaded: ${count}

TC-bookstore-02
    [Documentation]    특정 키워드 검색 시 결과 테이블에 해당 도서만 남는지 확인합니다.
    ${search_keyword}=    Set Variable    Learning JavaScript
    ${expected}=    Set Variable    Addy Osmani
    Fill Text    id=searchBox    ${search_keyword}
    # 검색된 결과 행의 개수 확인 (기대값: 1)
    # 빈 행(Pad rows)을 제외하고 실제 텍스트가 있는 행만 카운트
    ${result_count}    Get Element Count    css=.rt-tr-group >> text=${SEARCH_KEYWORD}
    Should Be Equal As Integers    ${result_count}    1
    # 저자 정보도 일치하는지 확인
    Get Text    css=.rt-tbody    contains    ${expected}

TC-bookstore-03
    [Documentation]    존재하지 않는 책 검색 시 결과가 없음을 확인합니다.
    ${invalid_keyword}=    Set Variable    samsung
    Fill Text    id=searchBox    ${invalid_keyword}
    # 결과 테이블이 비어있거나 특정 메시지가 있는지 확인
    # DemoQA 테이블은 빈 행이 유지되므로 '텍스트가 포함되지 않음'으로 검증
    Get Text    css=.rt-tbody    not contains    ${invalid_keyword}

TC-bookstore-04
    [Documentation]    책 클릭 시 상세 페이지로 이동하며 ISBN 등 정보가 일치하는지 확인합니다.
    # 특정 책 클릭
    ${search_keyword}=    Set Variable    Learning JavaScript Design Patterns
    ${expected_value}=    Set Variable    https://demoqa.com/books?book=9781449331818
    Click    text="${search_keyword}"
    Get Url    ==    ${expected_value}

TC-bookstore-05
    [Documentation]    테이블 표시 줄 수를 변경했을 때 UI가 반응하는지 확인합니다.
    # 하단 Rows 드롭다운 선택 (5 rows로 변경)
    Select Options By    css=select[aria-label="rows per page"]    value    5
    # 테이블의 전체 행(Group) 개수가 5개로 변했는지 검증
    ${rows}    Get Element Count    css=.rt-tr-group
    Should Be Equal As Integers    ${rows}    5
