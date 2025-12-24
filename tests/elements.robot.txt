*** Settings ***
Library    Browser
Resource   ../resources/keywords.resource
Suite Setup    New Browser    browser=chromium    headless=True

*** Test Cases ***
Verify DemoQA Text Box Submission
    [Documentation]    Text Box에 값을 입력하고 정상 제출되는지 확인합니다.
    New Page    https://demoqa.com/text-box
    Fill Text    id=userName    Gemini QA
    Fill Text    id=userEmail    test@example.com
    Click        id=submit
    
    Get Text     id=name    contains    Gemini QA
    Take Screenshot