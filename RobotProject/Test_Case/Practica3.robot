*** Settings ***
Documentation   Practica 3 para llenar y validar una forma
Library     SeleniumLibrary

*** Variables ***
# General variables
${browser}  Chrome
${websiteURL}  https://testpages.herokuapp.com/styled/basic-html-form-test.html

# Test Data
${name}     Claudeux
${password}     Legostarwars10.
${comment}      This is a test practice

# Locators
${nameFieldLocator}     name:username
${passwordFieldLocator}     name:password
${commentFieldLocator}      name:comments
${checkbox1Locator}     xpath://input[@name='checkboxes[]' and @value='cb1']
${checkbox3Locator}     xpath://input[@name='checkboxes[]' and @value='cb3']
${radioButton3Locator}      //input[@name='radioval' and @value='rd3']
${multipleSelectLocator}    //select[@name = 'multipleselect[]']
${dropdownLocator}      //select[@name = 'dropdown']
${submitButtonLocator}      //input[@name = 'submitbutton' and @value='submit']

*** Test Cases ***
Submit Basic Form Using Valid Data
    Open Website
    Set Selenium Implicit Wait  10s
    Set Selenium speed  0.01s

    #validate that title of the page it´s loaded
    Wait Until Page Contains    Basic HTML

    # validate element fields
    Validate Form Field     ${nameFieldLocator}
    Validate Form Field     ${passwordFieldLocator}
    Validate Form Field     ${commentFieldLocator}
    Validate Form Field     ${checkbox1Locator}
    Validate Form Field     ${checkbox3Locator}
    Validate Form Field     ${radioButton3Locator}
    Validate Form Field     ${multipleSelectLocator}
    Validate Form Field     ${dropdownLocator}
    Validate Form Field     ${submitButtonLocator}

    # test steps
    Input Text      ${nameFieldLocator}     ${name}
    Input Text      ${passwordFieldLocator}     ${password}
    Input Text      ${commentFieldLocator}  ${comment}
    Click Element   ${checkbox1Locator}
    # unselect checkbox 3
    Click Element   ${checkbox3Locator}
    # radio button
    Click Element   ${radioButton3Locator}
    # multiple select
    Select From List By Index   ${multipleSelectLocator}    0
    Select From List By Index   ${multipleSelectLocator}    2
    # unselect list
    Unselect From List By Index     ${multipleSelectLocator}    3
    # static dropdown
    Select From List By Value   ${dropdownLocator}  dd5

    # validate selected values for dropdown
    Validate Selected Value     ${dropdownLocator}    dd5

    # submit form
    Click Element   ${submitButtonLocator}
    Close Website

*** Keywords ***
Open Website
    Open Browser    ${websiteURL}   ${browser}
    Maximize Browser Window
Close Website
    Close Browser
Validate Form Field
    [Arguments]     ${targetLocator}
    Element Should Be Enabled   ${targetLocator}
    Element Should Be Visible   ${targetLocator}
Validate Selected Value
    [Arguments]     ${targetElementLocator}     ${targetValue}
    List Selection Should Be    ${targetElementLocator}     ${targetValue}