*** Settings ***
Documentation       This script is to know how to manage modal alerts
Library     SeleniumLibrary

*** Variables ***
#general variables
${browser}  Chrome
${websiteURL}   https://www.w3schools.com/bootstrap/bootstrap_modal.asp
#locators
${modalButtonLocator}   css:button[data-target ='#myModal']
${modalDismissButtonLocator}    xpath://div[@class='modal-footer']//button[@data-dismiss='modal']

*** Test Cases ***
Manage Modal Alerts
    [documentation]     This is to manage a modal alert
    [tags]  manage_modal_alerts
    #open website
    Open Website
    #define waits
    Set Selenium Implicit Wait  5s
    Set Selenium Speed  0.05s
    #check the tittle
    Title Should Be     Bootstrap Modals
    #check alert element to be loaded
    Validate Element   ${modalButtonLocator}
    #click the alert button
    Click Element   ${modalButtonLocator}
    #Verify alert, verify modal text, validate dismiss button, Click dissmiss
    Wait Until Page Contains    Some text in the modal.
    Validate Element    ${modalDismissButtonLocator}
    Click Element   ${modalDismissButtonLocator}
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