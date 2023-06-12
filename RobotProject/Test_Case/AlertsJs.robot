*** Settings ***
Documentation       This script is to know how to manage alerts
Library     SeleniumLibrary

*** Variables ***
#general variables
${browser}  Chrome
${websiteURL}   https://testpages.herokuapp.com/styled/alerts/alert-test.html
#locators
${showAlertBoxButtonLocator}    id:alertexamples
${showConfirmBoxButtonLocator}  id:confirmexample

*** Test Cases ***
Manage Simple Alerts
    [documentation]     This is to manage a simple alert
    [tags]  manage_simple_alerts
    #open website
    Open Website
    #define waits
    Set Selenium Implicit Wait  5s
    Set Selenium Speed  0.1s
    #check the tittle
    Title Should Be     Test Page For JavaScript Alerts
    #check alert element to be loaded
    Validate Element   ${showConfirmBoxButtonLocator}
    #click the alert button
    Click Element   ${showAlertBoxButtonLocator}
    #Verify alert
    Alert Should Be Present     I am an alert box!  ACCEPT
    #close website
    Close Website

Manage Confirm Alerts
    [documentation]     This is to manage a confirm alert
    [tags]  manage_confirm_alerts
    #open website
    Open Website
    #define waits
    Set Selenium Implicit Wait  5s
    Set Selenium Speed  0.1s
    #check the tittle
    Title Should Be     Test Page For JavaScript Alerts
    #check alert element to be loaded
    Validate Element   ${showConfirmBoxButtonLocator}
    #click the alert button
    Click Element   ${showConfirmBoxButtonLocator}
    #Verify alert
    Handle Alert    DISMISS
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