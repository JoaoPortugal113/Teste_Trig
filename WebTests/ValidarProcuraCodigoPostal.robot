*** Settings ***
Library     SeleniumLibrary
Library     Dialogs
Resource    CommonKeywords.robot



*** Variables ***
${CIDADE}  Coimbra
${RUA}     Rua João de Deus Ramos
${PORTA}   158A

*** Test Cases ***
ValidarPesquisaCodigoPostal
    [Documentation]     Valida a pesquisa do Codigo Postal
            Open Chrome
            Validar Pesquisa Codigo Postal

*** KeyWords ***
Validar Pesquisa Codigo Postal

        #Faz a pesquisa do Codigo Postal      
        Click Element                               //select[@id="distritos"]
        Wait Until Page Contains Element            //option[@value="${CIDADE}"]        10
        Click Element                               //option[@value="${CIDADE}"]
        Wait Until Page Contains Element            //select[@id="concelhos"]//option[@value="${CIDADE}"]       10
        Click Element                               //select[@id="concelhos"]//option[@value="${CIDADE}"]
        Input Text                                  //input[@name="localidade"]     ${CIDADE}
        Input Text                                  //input[@name="nomeRua"]        ${RUA}
        Input Text                                  //input[@name="numPorta"]      ${PORTA}
        Click Button                                //button[@id="buttonPostalCodeSearch"]
        
        #Valida que a informação é igual à introduzida
        ${ValidaPesquisa}=      Run Keyword And Return Status        Wait Until Page Contains Element   //td[contains(text(),'${RUA}')]     10
        Run Keyword If    ${ValidaPesquisa}==${FALSE}
        ...    Log To Console    Teste Falhado Informação devolvida está errada
        ...    AND      Close Browser

        ${Codigo_Postal}=       Get Text            (//td[contains(text(),'')])[2]
        Log To Console    ${Codigo_Postal}
