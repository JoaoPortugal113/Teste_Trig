*** Settings ***
Library     Collections
Library     Builtin
Library     RequestsLibrary


*** Variables ***
${API_BASE_ENDPOINT}        https://jsonplaceholder.typicode.com/
${COMMENTS}                 posts

*** Test Cases ***
ValidarPost

        Create Session      mysession                       ${API_BASE_ENDPOINT}
        ${body}=            Create Dictionary               postId=7        id=105      title=Ex nihilo nihil fit       body=Nitimur in vetitum nemo saltat sobrius pecunia non olet
        ${header}=          Create Dictionary               Content-Type=application/json; charset=utf-8
        ${response}=        Post Request                    mysession                   ${COMMENTS}        data=${body}        headers=${header}
        Log To Console      ${response.status_code}
        Log To Console      ${response.content}

        ${status_code}=     Convert To String               ${response.status_code}
        Should Be Equal     ${status_code}                  201