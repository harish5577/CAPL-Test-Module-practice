*** Settings ***
Library    ../libraries/VectorCANoeLibrary.py    mock_mode=${MOCK_MODE}

*** Variables ***
${CANOE_CONFIG}       ${CURDIR}${/}..${/}config${/}Type1_Test.cfg
${CAN_CHANNEL}        CAN
${IUT_NODE_NAME}      IUT_Node

*** Keywords ***
Connect And Initialize CANoe
    Connect Vector Canoe
    Open Canoe Configuration    ${CANOE_CONFIG}
    Initialize Can Channel      ${CAN_CHANNEL}
    Create Can Node             ${IUT_NODE_NAME}
    Start Measurement

Run TestType1 Received Frame Testcases
    ${ok_711}=    Run Capl Testcase    7.1.1
    Should Be True    ${ok_711}
    ${ok_712}=    Run Capl Testcase    7.1.2
    Should Be True    ${ok_712}
    Verify Executed Testcases    7.1.1    7.1.2

Collect Execution Marker
    ${file}=    Export Robot Report Marker
    Log    Marker file: ${file}

Shutdown CANoe Session
    Stop Measurement
