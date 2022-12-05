*** Settings ***
Library     Collections


*** Variables ***

${API_BASE_ENDPOINT}        https://jsonplaceholder.typicode.com/

*** Test Cases ***
ValidarGet

        Create Session