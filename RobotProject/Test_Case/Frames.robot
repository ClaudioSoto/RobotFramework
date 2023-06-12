*** Settings ***
Documentation       This script is to know how to manage frames
Library     SeleniumLibrary

*** Variables ***
#general variables
${browser}  Chrome
${websiteURL}   https://testpages.herokuapp.com/frames/index.html
#locators
${frameMenuLocator}     css:frame[name='menu']
${frameContentLocator}  css:frame[name='content']
${whitePageLinkLocator}     xpath://a[@href='white.html']
${whitePageTitleLocator}    //h1[contains(text(),'White Page')]
*** Test Cases ***
Manage Frames
    [documentation]     This is to manage a modal alert
    [tags]  manage_frames
    #open website
    Open Website
    #define waits
    Set Selenium Implicit Wait  5s
    Set Selenium Speed  0.05s
    #check the tittle
    Title Should Be     Frameset Example Title (Example 6)
    #Select the target frame
    Select Frame    ${frameMenuLocator}
    #validate element inside the frame
    Validate Element    ${whitePageLinkLocator}
    #Click the element inside the frame
    Click Element   ${whitePageLinkLocator}
    #Close the current frame
    Unselect Frame
    #Change to the central frame
    Select Frame    ${frameContentLocator}
    #Validate the redirection to the white page is correct
    Element Should Be Visible   ${whitePageTitleLocator}
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