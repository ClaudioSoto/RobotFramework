*** Settings ***
Documentation       This script practice the type of clicks on the links and elements
Library     SeleniumLibrary

*** Variables ***
#general variables
${browser}  Chrome
#locators
${menuFrameLocator}     name:menu
${contentFrameLocator}  name:content
${linkOptionLocator}    frames_example_1.html
${alertsMenuLocator}    xpath://div[text()='Alerts, Frame & Windows']
${modalSubmenuLocator}  xpath://body/div[@id='app']/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[3]/div[1]/ul[1]/li[5]

*** Test Cases ***
Manage Link Clicks
    [documentation]     This is to manage a link click
    [tags]  manage_link_clicks
    #open website
    Open Website    https://testpages.herokuapp.com/frames/index.html
    #define waits
    Set Selenium Implicit Wait  5s
    Set Selenium Speed  0.05s
    #check the tittle
    Title Should Be     Frameset Example Title (Example 6)
    #enter to the target frame
    Select Frame    ${menuFrameLocator}
    #click the link
    Click Link      ${linkOptionLocator}
    #exit the current frame
    Unselect Frame
    #Select the validation frame
    Select Frame    ${contentFrameLocator}
    #validate the title of the screen
    Wait Until Page Contains     Content
    #close website
    Close Website

*** Keywords ***
Open Website
    [arguments]     ${websiteURL}
    Open Browser    ${websiteURL}   ${browser}
    Maximize Browser Window
Close Website
    Close Browser
Validate Element
    [arguments]  ${locator}
    Wait Until Element Is Visible   ${locator}
    Wait Until Element Is Enabled   ${locator}
Validate Title
    [arguments]     ${title}
    Title Should Be     ${title}