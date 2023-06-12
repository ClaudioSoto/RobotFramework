*** Settings ***
Library     SeleniumLibrary

*** Variables ***
# Variables generales
${browser}  Chrome
${website}  https://demoqa.com/radio-button
${websiteTitle}     DEMOQA
${sleepTime}    0.5

#radio button locators
${radioYesLocator}      xpath://label[@for = 'yesRadio']
${radioImpresiveLocator}      xpath://label[@for = 'impressiveRadio']

*** Test Cases ***
Seleccionar radio button metodo 1
    [documentation]     Test case para seleccionar radio button con metodo1
    [tags]  select_radio_button_M1
    Open website
    Title Should Be     ${websiteTitle}
    Sleep   ${sleepTime}
    Click Element       ${radioYesLocator}
    Sleep   ${sleepTime}
    Click Element       ${radioImpresiveLocator}
    Sleep   ${sleepTime}
    Close Browser

*** Keywords ***
Open website
    Open Browser    ${website}  ${browser}
    Maximize Browser Window

Close website
    Close Browser