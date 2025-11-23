*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open Google
    Open Browser    https://www.google.com    Chrome
    Sleep    3s
    Title Should Be    Google
    Page Should Contain Element    name=q
    Close Browser

Check Google Title
    Open Browser    https://www.google.com    Chrome
    Title Should Be    Google
    Page Should Contain    Google Search
    Close Browser

Search Keyword on Google
    Open Browser    https://www.google.com    Chrome
    Input Text    name=q    Robot Framework
    Press Keys    name=q    RETURN
    Wait Until Page Contains    Robot Framework
    Page Should Contain Element    id=search
    Close Browser

Verify Search Results
    Open Browser    https://www.google.com    Chrome
    Input Text    name=q    Robot Framework
    Press Keys    name=q    RETURN
    Wait Until Page Contains    robotframework.org
    Page Should Contain    robotframework.org
    Close Browser

Search Image on Google Images
    Open Browser    https://www.google.com/imghp    Chrome
    Input Text    name=q    Robot Framework
    Press Keys    name=q    RETURN
    Wait Until Page Contains Element    //img[contains(@class,'rg_i')][1]
    Close Browser

Open Wikipedia Indonesia
    Open Browser    https://id.wikipedia.org    Chrome
    Title Should Be    Wikipedia bahasa Indonesia
    Page Should Contain Element    name=search
    Close Browser

Search Article on Wikipedia
    Open Browser    https://id.wikipedia.org    Chrome
    Input Text    name=search    Robot Framework
    Press Keys    name=search    RETURN
    Wait Until Page Contains    Robot Framework
    Page Should Contain    Robot Framework
    Close Browser

Open YouTube
    Open Browser    https://www.youtube.com    Chrome
    Title Should Be    YouTube
    Page Should Contain Element    name=search_query
    Close Browser

Search Video on YouTube
    Open Browser    https://www.youtube.com    Chrome
    Input Text    name=search_query    Robot Framework
    Press Keys    name=search_query    RETURN
    Wait Until Page Contains    Robot Framework
    Page Should Contain    Robot Framework
    Close Browser

Open Github and Check Title
    Open Browser    https://github.com    Chrome
    Title Should Be    GitHub: Let’s build from here · GitHub
    Page Should Contain Element    name=q
    Close Browser

Open Wikipedia
    Open Browser    https://www.wikipedia.org    Chrome
    Title Should Be    Wikipedia
    Page Should Contain Element    name=search
    Close Browser
