*** Settings ***
Library     SeleniumLibrary
Library     Builtin


*** Variables ***
${URL}          https://www.ctt.pt/feapl_2/app/open/postalCodeSearch/postalCodeSearch.jspx?request_locale=en
${BROWSER}      chrome

*** KeyWords ***
Open Chrome
        [Documentation]     Opens the browser with the desired webpage

        Open Browser        ${URL}      ${BROWSER}
        Maximize Browser Window
        ${ValidaBrowser}=        Run Keyword And Return Status        Wait Until Page Contains Element    //div[@class="brand-bar"]       5
        Run Keyword If    ${ValidaBrowser}==${FALSE}
        ...    Close Browser

Scroll to xpath
[Arguments]         ${XPATH}
    ${tmp}=     SeleniumLibrary.get element attribute   ${xpath}    id
    assign id to element    ${xpath}     scrollID
    execute javascript      document.getElementById('scrollID').scrollIntoView();
    run keyword if  '${tmp}' != '${EMPTY}'    assign id to element    ${xpath}     ${tmp}