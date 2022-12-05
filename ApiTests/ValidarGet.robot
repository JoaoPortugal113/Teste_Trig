*** Settings ***
Library     Collections
Library     RequestsLibrary
Library     JsonLibrary


*** Variables ***
${API_BASE_ENDPOINT}        https://jsonplaceholder.typicode.com/
${COMMENTS}                 posts/1/comments

*** Test Cases ***
ValidarGet

        Create Session      mysession       ${API_BASE_ENDPOINT}
        ${response}=        get request         mysession       ${COMMENTS}
        Log To Console    ${response.status_code}
        Log To Console    ${response.content}
        Log To Console    ${response.headers}