*** Settings ***
Documentation   Script to verify how the selects work
Library     SeleniumLibrary

*** Variables ***
# Common use variables
${browser}  Chrome
${website}  http://only-testing-blog.blogspot.com/2014/01/textbox.html
${sleepTime}    0.5

# Test data
${targetOption}     BMW Car

# Locators
${selectLocator}    css:select[id = 'Carlist']

*** Test Cases ***
Select usage
    [documentation]  Test case to see the select usage
    [tags]  select_usage
    Open Website
    Title Should Be     Only Testing: TextBox
    #previous validations for the select
    Element Should Be Enabled   ${selectLocator}
    Element Should Be Visible   ${selectLocator}

    #select and validate if the value is correct
    Select From List By Value   ${selectLocator}    ${targetOption}
    List Selection Should Be    ${selectLocator}  ${targetOption}

    #you can use the variants for select:
    #Select From List By Index
    #Select From List By Label
    Sleep   ${sleepTime}
    Close Website

*** Keywords ***
Open Website
    Open Browser    ${website}  ${browser}
    Maximize Browser Window
    Sleep   ${sleepTime}
Close Website
    Close Browser