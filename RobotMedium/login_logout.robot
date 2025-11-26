*** Settings ***
Library    AppiumLibrary

*** Variables ***
${REMOTE_URL}    http://localhost:4723
${PLATFORM_NAME}    Android
${APP}    RobotMedium/Saucelabs.apk
${APP_PACKAGE}    com.swaglabsmobileapp
${APP_ACTIVITY}    com.swaglabsmobileapp.SplashActivity
${USERNAME}    standard_user
${PASSWORD}    secret_sauce

*** Test Cases ***
Login Success And Access HomePage And Log Out
    [Tags]    positive
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    app=${APP}    automationName=UiAutomator2    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}
    Sleep    3s
    Input Text    xpath=//android.widget.EditText[@content-desc="test-Username"]    ${USERNAME}
    Input Text    xpath=//android.widget.EditText[@content-desc="test-Password"]    ${PASSWORD}
    Click Element    xpath=//android.view.ViewGroup[@content-desc="test-LOGIN"]
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="test-Menu"]/android.view.ViewGroup/android.widget.ImageView    20s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="test-Menu"]/android.view.ViewGroup/android.widget.ImageView
    Sleep    3s
    Click Element    xpath=//android.widget.TextView[@text="LOGOUT"]
    Close Application

Login Failed with Wrong Credentials
    [Tags]    negative
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    app=${APP}    automationName=UiAutomator2    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}
    Input Text    xpath=//android.widget.EditText[@content-desc="test-Username"]    wrong_user
    Input Text    xpath=//android.widget.EditText[@content-desc="test-Password"]    wrong_pass
    Click Element    xpath=//android.view.ViewGroup[@content-desc="test-LOGIN"]
    Wait Until Page Contains    Username and password do not match    10s
    Close Application

Lihat Detail Barang
    [Tags]    positive
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    app=${APP}    automationName=UiAutomator2    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}
    Sleep    3s
    Input Text    xpath=//android.widget.EditText[@content-desc="test-Username"]    ${USERNAME}
    Input Text    xpath=//android.widget.EditText[@content-desc="test-Password"]    ${PASSWORD}
    Click Element    xpath=//android.view.ViewGroup[@content-desc="test-LOGIN"]
    Sleep    2s
    Click Element    xpath=(//android.view.ViewGroup[@content-desc="test-Item"])[1]/android.view.ViewGroup/android.widget.ImageView
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="BACK TO PRODUCTS"]    10s
    Click Element    xpath=//android.widget.TextView[@text="BACK TO PRODUCTS"]
    Close Application

Add To Cart
    [Tags]    positive
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    app=${APP}    automationName=UiAutomator2    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}
    Sleep    3s
    Input Text    xpath=//android.widget.EditText[@content-desc="test-Username"]    ${USERNAME}
    Input Text    xpath=//android.widget.EditText[@content-desc="test-Password"]    ${PASSWORD}
    Click Element    xpath=//android.view.ViewGroup[@content-desc="test-LOGIN"]
    Sleep    2s
    Click Element    xpath=(//android.widget.TextView[@text="ADD TO CART"])[1]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="test-Cart"]/android.view.ViewGroup/android.widget.ImageView
    Close Application
