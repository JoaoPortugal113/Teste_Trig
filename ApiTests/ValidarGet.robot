*** Settings ***
Library     Collections
Library     Builtin
Library     RequestsLibrary


*** Variables ***
${API_BASE_ENDPOINT}        https://jsonplaceholder.typicode.com/
${COMMENTS}                 posts/1/comments

*** Test Cases ***
ValidarGet

        Create Session              mysession                       ${API_BASE_ENDPOINT}
        ${response}=                get request                     mysession                   ${COMMENTS}

        #Validar Status Code
        ${status_code}=             Convert To String               ${response.status_code}
        Should Be Equal             ${status_code}                  200
        Log To Console              ${response.status_code}

        #ValidarBody
        ${body}=                    Convert To String               ${response.content}
        Should Contain              ${body}                         id labore ex et quam laborum
        Log To Console              ${response.content}

        #ValidarHeader
        ${contentTypeValue}=        Get From Dictionary             ${response.headers}         Content-Type
        Should Be Equal             ${contentTypeValue}             application/json; charset=utf-8
        Log To Console              ${response.headers}