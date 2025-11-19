*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open Google
    Open Browser    https://www.google.com    Chrome
    Sleep    3s
    Close Browser

Check Google Title
    Open Browser    https://www.google.com    Chrome
    Title Should Be    Google
    Close Browser

Search Keyword on Google
    Open Browser    https://www.google.com    Chrome
    Input Text    name=q    Robot Framework
    Press Keys    name=q    RETURN
    Sleep    2s
    Close Browser

Verify Search Results
    Open Browser    https://www.google.com    Chrome
    Input Text    name=q    Robot Framework
    Press Keys    name=q    RETURN
    Wait Until Page Contains    robotframework.org
    Close Browser
