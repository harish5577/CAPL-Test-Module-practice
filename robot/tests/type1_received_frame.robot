*** Settings ***
Resource    ../resources/vector_can_keywords.resource
Library     OperatingSystem
Suite Setup       Connect And Initialize CANoe
Suite Teardown    Shutdown CANoe Session

*** Variables ***
${MOCK_MODE}    ${TRUE}

*** Test Cases ***
Run 7.1.1 And 7.1.2 CAPL Test Module From Robot
    [Documentation]    Connect CANoe, initialize CAN, create node, and run CAPL Type-1 tests 7.1.1 and 7.1.2.
    Run TestType1 Received Frame Testcases
    Collect Execution Marker
    File Should Exist    ${CURDIR}${/}..${/}reports${/}executed_testcases.txt
