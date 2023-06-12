*** Settings ***
Documentation   Este es el proyecto de estudio previos al trabajo con ASML
Library     SeleniumLibrary

*** Variables ***
#general variables
${browser}  Chrome
${website}  https://demoqa.com/text-box
${name}  Luis Claudio Soto Ayala
${email}    claudio.soto.ayala@gmail.com
${address}  Alamo Country Club, Paris #124
${permanentAddress}  Alamo Country Club, Paris #124

#field locators
${userNameXpath}    //input[@id='userName']
${userEmailXpath}    //input[@id='userEmail']
${currentAddressId}    currentAddress
${permanentAddressId}    permanentAddress
${submitButtonXpath}    //button[@id='submit']
${nameResultXpath}  //p[@id='name']

#verification locators
${nameResultXpath}  //p[@id='name']
${emailResultXpath}  //p[@id='email']
${currentAddressResultXpath}  //p[@id='currentAddress']
${permanentAddressResultXpath}  //p[@id='permanentAddress']

*** Test Cases ***
Submit personal data valid
    [Documentation]  Este test case prueba el submit de los datos personales usando datos validos
    [Tags]  submit_personal_data_valid
    Go_To_Website
    Maximize Browser Window
    Input Text  xpath:${userNameXpath}   ${name}
    Input Text  xpath:${userEmailXpath}   ${email}
    Input Text  id:${currentAddressId}   ${address}
    Input Text  id:${permanentAddressId}   ${permanentAddress}
    execute javascript  window.scrollTo(0,200)
    Sleep   1s
    Click Button   xpath:${submitButtonXpath}
    Element Should Contain  xpath:${nameResultXpath}  ${name}
    Element Should Contain  xpath:${emailResultXpath}  ${email}
    Element Should Contain  xpath:${currentAddressResultXpath}  ${address}
    Element Should Contain  xpath:${permanentAddressResultXpath}  ${permanentAddress}
    Close_ Website

Submit personal data invalid
    [Documentation]  Este test case prueba el submit de los datos personales usando datos invalidos
    [Tags]  submit_personal_data_invalid
    Go_To_Website
    Maximize Browser Window
    Input Text  xpath:${userNameXpath}   ${name}
    Input Text  xpath:${userEmailXpath}   ${email}
    Input Text  id:${currentAddressId}   ${address}
    Input Text  id:${permanentAddressId}   ${permanentAddress}
    execute javascript  window.scrollTo(0,200)
    Sleep   1s
    Click Button   xpath:${submitButtonXpath}
    Element Should Contain  xpath:${nameResultXpath}  ${name}
    Element Should Contain  xpath:${emailResultXpath}  ${email}
    Element Should Contain  xpath:${currentAddressResultXpath}  ${address}
    Element Should Contain  xpath:${permanentAddressResultXpath}  ${permanentAddress}
    Close_ Website

*** Keywords ***
Go_To_Website
    open browser    ${website}  ${browser}
Close_ Website
    Close browser
