*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.google.com
${BROWSER}    Chrome

*** Test Cases ***
Open Google Homepage
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Google
    Page Should Contain Element    name=q
    Close Browser

Search Keyword
    Open Browser    ${URL}    ${BROWSER}
    Input Text    name=q    Robot Framework
    Press Keys    name=q    RETURN
    Wait Until Page Contains    Robot Framework    5s
    Close Browser
