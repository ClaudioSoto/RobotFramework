*** Settings ***
Documentation       Practice 6, validating a login feature
Library     SeleniumLibrary

*** Variables ***
#general variables
${browser}  Chrome
${websiteURL}   https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
#test data
${validUser}    Admin
${validPassword}    admin123
${invalidUser}  InvalidAdmin
${invalidPassword}  admin456
#locators
${usernameFieldLocator}    name:username
${passwordFieldLocaror}     name:password
${loginButton}      class:oxd-button
${dashboardElement}     xpath://h6[text()='Dashboard']
#expected error messages locators
${invalidCredentialsLocator}    xpath://p[text()='Invalid credentials']
${emptyFieldsLocator}   xpath://span[text()='Required']

*** Test Cases ***
Verify Login Valid Data
    [documentation]     Test the login using valid data
    [tags]  verify_login_valid_data
    #open website
    Open Website
    #define waits
    Set Selenium Waits
    #check the tittle
    Title Should Be     OrangeHRM
    #field validations
    Validate Element    ${usernameFieldLocator}
    Validate Element    ${passwordFieldLocaror}
    #enter/send the values
    Input Text  ${usernameFieldLocator}     ${validUser}
    Input Text  ${passwordFieldLocaror}     ${validPassword}
    Click Element   ${loginButton}
    #validate element for the login screen
    Wait Until Element Is Visible   ${dashboardElement}
    Log To Console      Test Passed: Login using valid credentials
    #close website
    Close Website

Verify Login Invalid Data
    [documentation]     Test the login using invalid data
    [tags]  verify_login_invalid_data
    #open website
    Open Website
    #define waits
    Set Selenium Waits
    #check the tittle
    Title Should Be     OrangeHRM
    #field validations
    Validate Element    ${usernameFieldLocator}
    Validate Element    ${passwordFieldLocaror}
    #enter/send the values
    Input Text  ${usernameFieldLocator}     ${invalidUser}
    Input Text  ${passwordFieldLocaror}     ${invalidPassword}
    Click Element   ${loginButton}
    #validate element for the login screen
    Wait Until Element Is Visible   ${invalidCredentialsLocator}
    Log To Console      Test Passed: Login using invalid credentials
    #close website
    Close Website

Verify Login Empty User
    [documentation]     Test the login using empty user
    [tags]  verify_login_empty_user
    #open website
    Open Website
    #define waits
    Set Selenium Waits
    #check the tittle
    Title Should Be     OrangeHRM
    #field validations
    Validate Element    ${usernameFieldLocator}
    Validate Element    ${passwordFieldLocaror}
    #enter/send the values
    Input Text  ${passwordFieldLocaror}     ${validPassword}
    Click Element   ${loginButton}
    #validate element for the login screen
    Wait Until Element Is Visible   ${emptyFieldsLocator}
    Log To Console      Test Passed: Login using empty username
    #close website
    Close Website

Verify Login Empty Password
    [documentation]     Test the login using empty password
    [tags]  verify_login_empty_password
    #open website
    Open Website
    #define waits
    Set Selenium Waits
    #check the tittle
    Title Should Be     OrangeHRM
    #field validations
    Validate Element    ${usernameFieldLocator}
    Validate Element    ${passwordFieldLocaror}
    #enter/send the values
    Input Text  ${usernameFieldLocator}     ${validUser}
    Click Element   ${loginButton}
    #validate element for the login screen
    Wait Until Element Is Visible   ${emptyFieldsLocator}
    Log To Console      Test Passed: Login using empty password
    #close website
    Close Website

Verify Login Empty Fields
    [documentation]     Test the login using empty fields
    [tags]  verify_login_empty_fields
    #open website
    Open Website
    #define waits
    Set Selenium Waits
    #check the tittle
    Title Should Be     OrangeHRM
    #field validations
    Validate Element    ${usernameFieldLocator}
    Validate Element    ${passwordFieldLocaror}
    #enter/send the values
    Click Element   ${loginButton}
    #validate element for the login screen
    Wait Until Element Is Visible   ${emptyFieldsLocator}
    Log To Console      Test Passed: Login using empty fields
    #close website
    Close Website

*** Keywords ***
Open Website
    Open Browser    ${websiteURL}   ${browser}
    Maximize Browser Window
Close Website
    Close Browser
Validate Element
    [arguments]  ${locator}
    Wait Until Element Is Visible   ${locator}
    Wait Until Element Is Enabled   ${locator}
Set Selenium Waits
    Set Selenium Implicit Wait  5s
    Set Selenium Speed  0.001s