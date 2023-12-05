*** Settings ***
Documentation       Inhuman Insurance, Inc. Artificial Intelligence System robot.
...                 Produces traffic data work items.

Library             RPA.HTTP
Library             RPA.Tables
Library             RPA.JSON


*** Tasks ***
Produce traffic data work items
    Load traffic data as table
    Log    Producer Done.

*** Keywords ***
Download traffic data
    Download
    ...    https://github.com/robocorp/inhuman-insurance-inc/raw/main/RS_198.json
    ...    ${OUTPUT_DIR}${/}traffic.json
    ...    overwrite=True

Load traffic data as table
    ${json}=    Load JSON from file    ${OUTPUT_DIR}${/}traffic.json
    ${table}=    Create Table    ${json}[value]
    RETURN    ${table}