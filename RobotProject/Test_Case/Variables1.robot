*** Settings ***
Library     SeleniumLibrary

*** Variables ***
#variables globales
${strings}   claudio

*** Test Cases ***
Variables locales
    #variables locales
    ${localVarExample}  set variable    local variable

Imprimir en reportes
    Log     ${strings}

Imprimir en consola y reportes
    Log To Console      ${strings}

Operaciones de variables
    ${numbers1}     set variable    10.0
    ${numbers2}     set variable    20.5
    ${suma}     Evaluate    ${numbers1}+${numbers2}
    ${resta}    Evaluate    ${numbers1}-${numbers2}
    ${multiplicacion}       Evaluate    ${numbers1}*${numbers2}
    ${division}     Evaluate    ${numbers1}/${numbers2}
    Log To console      ${suma}
    Log To console      ${resta}
    Log To console      ${multiplicacion}
    Log To console      ${division}

*** Keywords ***