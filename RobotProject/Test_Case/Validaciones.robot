*** Settings ***
Documentation   Ejemplo vara validar diferente tipo de aspectos con asserts
Library     SeleniumLibrary

*** Variables ***
# Variables generales
${browser}  Chrome
${website}  https://demoqa.com/text-box
${expectedTitle}    DEMOQA
${expetedAttributeValue}    Full Name
${sleepTime}    .2

# Locators de elementos
${fullNameFieldLocator}     xpath://input[@id = 'userName']
${submitButtonLocator}      xpath://button[@id='submit']

*** Test Cases ***
Verificar titulo de la pagina
    [Documentation]     Este caso sirve para validar el titulo de la pagina
    [Tags]  verificar_titulo_website
    Open website
    Title Should Be     ${expectedTitle}
    Close website

Verificar visibilidad de los campos
    [documentation]  Este caso sirve vara validar si es visible el campo
    [tags]  verificar_visibilidad_campo
    Open website
    Element Should Be Visible       ${fullNameFieldLocator}
    Input Text      ${fullNameFieldLocator}     Es visible
    Sleep   ${SleepTime}
    Close website

Verificar la no visibilidad de los elementos
    [documentation]  Este caso sirve vara validar si no es visible el campo
    [tags]  verificar_no_visibilidad_campo
    Open website
    Element Should Not Be Visible       xpaht://input[@a='not a real xpath']
    Element Should Be Visible       ${fullNameFieldLocator}
    Input Text      ${fullNameFieldLocator}     No es visible
    Sleep   ${SleepTime}
    Close website

Verificar disponibilidad de los campos
    [documentation]  Este caso sirve vara validar si es enabled el campo
    [tags]  verificar_disponibilidad_campo
    Open website
    Element Should Be Enabled       ${fullNameFieldLocator}
    Input Text      ${fullNameFieldLocator}     Es enabled
    Sleep   ${SleepTime}
    Close website

Validar por atributo del campo
    [documentation]  Este caso sirve para validar por valor de atributo
    [tags]  validar_por_atributo
    Open website
    Element Attribute Value Should Be       ${fullNameFieldLocator}     placeholder     ${expetedAttributeValue}
    Input Text      ${fullNameFieldLocator}     Attribute value is correct
    Sleep   ${SleepTime}
    Close website

*** Keywords ***
Open website
    Open Browser    ${website}  ${browser}
    Maximize Browser Window

Close website
    Close Browser