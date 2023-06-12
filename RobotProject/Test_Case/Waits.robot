*** Settings ***
Documentation   Script to verify how the selects work
Library     SeleniumLibrary

*** Variables ***
# Common use variables
${browser}  Chrome
${website}  http://only-testing-blog.blogspot.com/2014/01/textbox.html

# Test data
${targetOption}     BMW Car

# Locators
${selectLocator}    css:select[id = 'Carlist']

*** Test Cases ***
Selenium speed function usage
    [documentation]  Test case to see the selenium speed function usage
    [tags]  set_selenium_speed_usage
    Open Website
    Set Selenium Speed  0.1s
    Title Should Be     Only Testing: TextBox
    #previous validations for the select
    Element Should Be Enabled   ${selectLocator}
    Element Should Be Visible   ${selectLocator}
    #select and validate if the value is correct
    Select From List By Value   ${selectLocator}    ${targetOption}
    List Selection Should Be    ${selectLocator}  ${targetOption}
    Close Website

*** Keywords ***
Open Website
    Open Browser    ${website}  ${browser}
    Maximize Browser Window
    Sleep   ${sleepTime}
Close Website
    Close Browser