*** Settings ***
Library     SeleniumLibrary
Library     Dialogs
Resource    CommonKeywords.robot



*** Variables ***
${LOCALIDADE}   Coimbra
${POBOX}        123456

*** Test Cases ***
ValidarProcuraCodigoPostal
    [Documentation]     Valida a pesquisa do Codigo Postal
            Open Chrome
            Validar Procura Codigo Postal

*** KeyWords ***
Validar Procura Codigo Postal

        #Faz a pesquisa pelo Codigo Postal
        Wait Until Page Contains Element            //a[contains(text(),'PO Box')]      10
        Click Element                               //a[contains(text(),'PO Box')]
        Wait Until Page Contains Element            //input[@name="localidadeA"]        10
        Input Text                                  //input[@name="localidadeA"]     ${LOCALIDADE}
        Click Element                               //select[@name="ep"]
        Click Element                               //option[contains(text(),'BEC CARNAXIDE')]
        Input Text                                  //input[@name="nApartado"]      ${POBOX}
        Click Button                                //button[@id="buttonPostalBoxSearch"]

        #Espera pela mensagem de Erro
        ${ValidaMensagemErro}=      Run Keyword And Return Status        Wait Until Page Contains Element   //div[@id="actionErrors"]     10
        Run Keyword If    ${ValidaMensagemErro}==${FALSE}
        ...    Log To Console    Mensagem de erro deveria ter aparecido e não apareceu!
        ...    AND      Close Browser