*** Settings ***
Library     SeleniumLibrary
Library     Dialogs
Resource    CommonKeywords.robot



*** Variables ***
${CP_FIRST4}    3030
${CP_LAST3}     183

*** Test Cases ***
ValidarProcuraCodigoPostal
    [Documentation]     Valida a pesquisa do Codigo Postal
            Open Chrome
            Validar Procura Codigo Postal

*** KeyWords ***
Validar Procura Codigo Postal

        #Faz a pesquisa pelo Codigo Postal
        Wait Until Page Contains Element            //a[contains(text(),'Find the address')]     10
        Click Element                               //a[contains(text(),'Find the address')]
        Input Text                                  //input[@name="cp4"]     ${CP_FIRST4}
        Input Text                                  //input[@name="cp3"]     ${CP_LAST3}
        Click Button                                //button[@id="buttonAddressSearch"]

        Wait Until Page Contains Element            //table[@class="full-width"]
        ${num_end}=     Get Element Count           (//td[contains(text(),'${CP_FIRST4}-${CP_LAST3}')])
        Log To Console    ${\n}Numero de Endereços:${num_end}${\n}
        ${runs}=    Evaluate   ${num_end}+1
            FOR    ${i}    IN RANGE     1       ${runs}

            ${end}=     Get Text    (//td[@colspan="2"])[${i}]
            ${cp}=      Get Text    (//td[contains(text(),'${CP_FIRST4}-${CP_LAST3}')])[${i}]
            Log To Console    ${i}
            Log To Console    Endereço_${i}:${end}${\n}Codigo Postal_${i}:${cp}}
            END