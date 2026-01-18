*** Settings ***
Variables         ../config.py

*** Keywords ***
Login
    [Arguments]    ${id}    ${pw}
    Fill Text    id=userName    ${id}
    Fill Text    id=password    ${pw}
    Click    id=login

setup
    Set Browser Timeout    ${timeout}
    New Browser    chromium    headless=True
