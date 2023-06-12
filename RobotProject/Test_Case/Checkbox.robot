*** Settings ***
Documentation   Script to verify how the checkboxes work
Library     SeleniumLibrary

*** Variables ***
# Common use variables
${browser}  Chrome
${website}  https://demoqa.com/checkbox
${sleepTime}    0.5

# Locators
${checkboxLocator}  css:span[class = 'rct-checkbox']
${resultTextLocator}    xpath:(//div[@id='result']//span)[1]

*** Test Cases ***
Checkbox usage
    [documentation]  Test case to see the checkbox usage
    [tags]  checkbox_usage
    Open Website
    Title Should Be     DEMOQA
    #validate if the checkbox its visible and enabled
    Element Should Be Visible   ${checkboxLocator}
    Element Should Be Enabled   ${checkboxLocator}
    Click Element   ${checkboxLocator}
    Sleep       ${sleepTime}
    #validate if the text it´s being displayed
    Element Should Contain  ${resultTextLocator}    You have selected
    Close Website

*** Keywords ***
Open Website
    Open Browser    ${website}  ${browser}
    Maximize Browser Window
Close Website
    Close Browser