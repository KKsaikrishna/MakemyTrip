*** Settings ***
Documentation       MakeMyTrip Flight ticket Booking.

Library             RPA.Browser.Selenium    
Library             Dialogs
Library             RPA.Desktop.Windows
Library             RPA.Dialogs
Library             RPA.Windows
Library             RPA.JSON
Library             Collections
Library             RPA.Excel.Files


*** Tasks ***
Flight ticket Details makemytrip
    #Load config
    ${Config}=    Load JSON from file    Config.json
    ${URL}=    Set Variable    ${Config}[URL]
    Opens MakeMyTrip URL    ${URL}    
    Clicks on flight icon
    Trip preference
    Trip way Dialog
    User Fare selection
    Fare selection
    Adult PAX Selection
    Children PAX Selection
    Infant PAX Selection
    Travellers & Class
    Flight details to the route
    Scraping part

*** Keywords ***
Opens MakeMyTrip URL
    [Arguments]    ${URL}
    Open Available Browser    ${URL}    
    Maximize Browser Window
    

Clicks on flight icon
    Click Element    //*[@id="SW"]/div[1]/div[2]/div/div/nav/ul/li[1]/div/a/span[2]

Trip preference
    Add drop-down    Choose trip mode    ONEWAY, ROUNDTRIP, MULTICITY

Trip way Dialog
    ${Dialog}=    Show dialog    title=Trip preference
    ${Result}=    Wait dialog    ${Dialog}
    Log To Console    ${Result}
    Sleep    3s
    IF    'ONEWAY' == '${Result}[Choose trip mode]'
        Sleep    2s
        Click Element    //*[@id="root"]/div/div[2]/div/div/div[2]/div[1]/div[3]/label/p[1]
        Sleep    2s
        ${UserDate}=    Get Value From User    Enter the Date as mentioned format DAY MM DATE YEAR
        Sleep    3s
        Click Element    xpath=//div[@aria-label="${UserDate}"]
        Sleep    3s
        Click Element    //*[@id="root"]/div/div[2]/div/div/div[1]/ul/li[1]
        Sleep    2s
        ${Origin}=    Get Value From User    Enter the origin
        Click Element    //*[@id="fromCity"]
        Input Text    //*[@id="root"]/div/div[2]/div/div/div[2]/div[1]/div[1]/div[1]/div/div/div/input    ${Origin}
        Sleep    3s
        Click Element    css:li[id="react-autowhatever-1-section-0-item-0"]
        ${Dest}=    Get Value From User    Enter the Dest
        Click Element    //*[@id="toCity"]
        Input Text    //*[@id="root"]/div/div[2]/div/div/div[2]/div[1]/div[2]/div[1]/div/div/div[1]/input    ${Dest}
        Sleep    3s
        Click Element    css:li[id="react-autowhatever-1-section-0-item-0"]
        Sleep    4s
    ELSE IF    'ROUNDTRIP' == '${Result}[Choose trip mode]'
        Sleep    3s
        Click Element    //*[@id="root"]/div/div[2]/div/div/div[1]/ul/li[2]
        Sleep    2s
        Click Element    //*[@id="root"]/div/div[2]/div/div/div[2]/div[1]/div[3]/label
        Sleep    4s
        ${UserDate}=    Get Value From User    Enter the Date as mentioned format DAY MM DATE YEAR
        Sleep    3s
        Click Element    xpath=//div[@aria-label="${UserDate}"]
        Sleep    3s
        ${UserDate1}=    Get Value From User    Enter the Date as mentioned format    DAY MM DATE YEAR
        Sleep    3s
        Click Element    xpath=//div[@aria-label="${UserDate1}"]
        Sleep    3s
        #Click Element    //*[@id="root"]/div/div[2]/div/div/div[2]/p/a
        #Click Element    //*[@id="root"]/div/div[2]/div/div/div[1]/ul/li[2]
        ${Origin}=    Get Value From User    Enter the origin
        Click Element    //*[@id="fromCity"]
        Input Text    //*[@id="root"]/div/div[2]/div/div/div[2]/div[1]/div[1]/div[1]/div/div/div/input    ${Origin}
        Sleep    3s
        Click Element    css:li[id="react-autowhatever-1-section-0-item-0"]
        ${Dest}=    Get Value From User    Enter the Dest
        Click Element    //*[@id="toCity"]
        Input Text    //*[@id="root"]/div/div[2]/div/div/div[2]/div[1]/div[2]/div[1]/div/div/div[1]/input    ${Dest}
        Sleep    3s
        Click Element    css:li[id="react-autowhatever-1-section-0-item-0"]
        Sleep    2s
    ELSE IF    'MULTICITY'=='${Result}[Choose trip mode]'
        Sleep    2s
        Click Element    //*[@id="root"]/div/div[2]/div/div/div[1]/ul/li[3]
        Sleep    2s
        ${OriginM}=    Get Value From User    Enter the origin
        Click Element    //*[@id="fromAnotherCity0"]
        Input Text
        ...    //*[@id="root"]/div/div[2]/div/div/div[2]/div/div[1]/div[1]/div[1]/div/div/div/input
        ...    ${OriginM}
        Sleep    3s
        Click Element    css:li[id="react-autowhatever-1-section-0-item-0"]
        ${DestM}=    Get Value From User    Enter the Dest
        Sleep    2s
        Click Element    //*[@id="toAnotherCity0"]
        Sleep    2s
        Input Text
        ...    //*[@id="root"]/div/div[2]/div/div/div[2]/div/div[1]/div[2]/div[1]/div/div/div[1]/input
        ...    ${DestM}
        Sleep    2s
        Click Element    css:li[id="react-autowhatever-1-section-0-item-0"]
        ${Origin1}=    Get Value From User    Enter the origin
        Click Element    //*[@id="fromAnotherCity1"]
        Input Text
        ...    //*[@id="root"]/div/div[2]/div/div/div[2]/div/div[1]/div[2]/div[1]/div/div/div[1]/input
        ...    {Origin1}
        Sleep    2s
        Click Element    css:li[id="react-autowhatever-1-section-0-item-0"]
        ${Dest1}=    Get Value From User    Enter the Dest
        Click Element    //*[@id="toAnotherCity1"]
        Sleep    2s
        Input Text
        ...    //*[@id="root"]/div/div[2]/div/div/div[2]/div/div[2]/div[2]/div[1]/div/div/div[1]/input
        ...    ${Dest1}
        Sleep    2s
        Click Element    css:li[id="react-autowhatever-1-section-0-item-0"]
        Sleep    2s
        Click Element    //*[@id="root"]/div/div[2]/div/div/div[2]/div[1]/div[3]/label
        Sleep    4s
        ${UserDate}=    Get Value From User    Enter the Date as mentioned format DAY MM DATE YEAR
        Sleep    3s
        Click Element    xpath=//div[@aria-label="${UserDate}"]
        Sleep    3s
        Click Element    //*[@id="root"]/div/div[2]/div/div/div[2]/div[1]/div[4]/div[2]/label/p
        Sleep    4s
        ${UserDate1}=    Get Value From User    Enter the Date as mentioned format    DAY MM DATE YEAR
        Sleep    3s
        Click Element    xpath=//div[@aria-label="${UserDate1}"]
        Sleep    3s
        Click Element    //*[@id="root"]/div/div[2]/div/div/div[2]/p/a
        Sleep    7s
        Click Element If Visible    //*[@id="root"]/div/div[2]/div[2]/div[2]/div/div/div[3]/button
    END

User Fare selection
    Add drop-down
    ...    FareType
    ...    RegularFares, ArmedForcesFares, StudentFares, SeniorCitizenFares, Doctors & NursesFares

Fare selection
    ${FareType}=    Show dialog    title=Fare selection    height=AUTO    width=480
    ${Final}=    Wait dialog    ${FareType}
    Sleep    2s
    Log To Console    ${Final}
    IF    'RegularFares' == '${Final}[FareType]'
        Sleep    2s
        Click Element    //*[@id="root"]/div/div[2]/div/div/div[2]/div[2]/div[1]/ul/li[1]/p
    ELSE IF    'ArmedForcesFares'=='${Final}[FareType]'
        Sleep    2s
        Click Element    //*[@id="root"]/div/div[2]/div/div/div[2]/div[2]/div[1]/ul/li[2]/p
    ELSE IF    'StudentFares' == '${Final}[FareType]'
        Sleep    2s
        Click Element    //*[@id="root"]/div/div[2]/div/div/div[2]/div[2]/div[1]/ul/li[3]/p
    ELSE IF    'SeniorCitizenFares'== '${Final}[FareType]'
        Sleep    2s
        Click Element    //*[@id="root"]/div/div[2]/div/div/div[2]/div[2]/div[1]/ul/li[4]/p
    ELSE IF    'Doctors & NursesFares' == '${Final}[FareType]'
        Sleep    2s
        Click Element    //*[@id="root"]/div/div[2]/div/div/div[2]/div[2]/div[1]/ul/li[5]/p
    END

Adult PAX Selection
    Click Element    //*[@id="root"]/div/div[2]/div/div/div[2]/div[1]/div[5]/label/p[1]/span
    Sleep    2s
    ${Input}=    Get Value From User    Enter adults count
    Sleep    1s
    Click Element    xpath=//li[@data-cy="adults-${Input}"]

Children PAX Selection
    ${Input}=    Get Value From User    Enter Children count
    Sleep    1s
    Click Element    xpath=//li[@data-cy="children-${Input}"]

Infant PAX Selection
    ${Input}=    Get Value From User    Enter Infant count
    Sleep    1s
    Click Element    xpath=//li[@data-cy="infants-${Input}"]

Travellers & Class
    Add drop-down    Travel Class    Economy, Premium Economy, Business
    ${Class}=    Show dialog    title=Travellers & Class
    ${Class1}=    Wait dialog    ${Class}
    Log To Console    ${Class1}
    IF    'Economy' == '${Class1}[Travel Class]'
        Sleep    2s
        Click Element    //*[@id="root"]/div/div[2]/div/div/div[2]/div[1]/div[5]/div[2]/div[1]/ul[2]/li[1]
        Sleep    2s
        Click Element    //*[@id="root"]/div/div[2]/div/div/div[2]/div[1]/div[5]/div[2]/div[2]/button
    ELSE IF    'Premium Economy' =='${Class1}[Travel Class]'
        Sleep    2s
        Click Element    //*[@id="root"]/div/div[2]/div/div/div[2]/div[1]/div[5]/div[2]/div[1]/ul[2]/li[2]
        Sleep    2s
        Click Element    //*[@id="root"]/div/div[2]/div/div/div[2]/div[1]/div[5]/div[2]/div[2]/button
    ELSE IF    'Business'== '${Class1}[Travel Class]'
        Sleep    2s
        CLICK Element    //*[@id="root"]/div/div[2]/div/div/div[2]/div[1]/div[5]/div[2]/div[1]/ul[2]/li[3]
        Sleep    2s
        Click Element    //*[@id="root"]/div/div[2]/div/div/div[2]/div[1]/div[5]/div[2]/div[2]/button
    END

Flight details to the route
    Click Element    //*[@id="root"]/div/div[2]/div/div/div[2]/p/a
    Sleep    6s
    ${Counter}=    Set Variable    2
    ${Flight_Name}=    Get WebElements    xpath=//p[@class="boldFont blackText airlineName"]
    Sleep    4s
    Log To Console    ${Flight_Name}
    FOR    ${Value1}    IN    @{Flight_Name}
        ${Get_v}=    RPA.Browser.Selenium.Get Text    ${Value1}
        Log To Console    ${Get_v}
        Open Workbook    Output.xlsx    Overwrite=True
        Read Worksheet    Sheet1    header=True
        Set Cell Value    ${Counter}    A    ${Get_v}
        Save Workbook
        ${Counter}=    Evaluate    ${Counter} + 1
    END
    ${Counter}=    Set Variable    2
    ${Flight_code}=    Get WebElements    xpath=//p[@class="fliCode"]
    Log To Console    ${Flight_code}
    FOR    ${value2}    IN    @{Flight_code}
        ${Get_C}=    RPA.Browser.Selenium.Get Text    ${value2}
        Log To Console    ${Get_C}
        Open Workbook    Output.xlsx    Overwrite=True
        Read Worksheet    Sheet1    header=True
        Set Cell Value    ${Counter}    B    ${Get_C}
        Save Workbook
        ${Counter}=    Evaluate    ${Counter} + 1
    END
    ${Counter}=    Set Variable    2
    ${Dept_DT}=    Get WebElements    xpath=//p[@class="appendBottom2 flightTimeInfo"]
    Log To Console    ${Dept_DT}
    FOR    ${value2}    IN    @{Dept_DT}
        ${Get_D}=    RPA.Browser.Selenium.Get Text    ${value2}
        Log To Console    ${Get_D}
        Open Workbook    Output.xlsx    Overwrite=True
        Read Worksheet    Sheet1    header=True
        Set Cell Value    ${Counter}    C    ${Get_D}
        Save Workbook
        ${Counter}=    Evaluate    ${Counter} + 1
    END

    ${Counter}=    Set Variable    2
    ${Arrival_DT}=    Get WebElements    xpath=//p[@class="appendBottom2 flightTimeInfo"]
    Log To Console    ${Arrival_DT}
    FOR    ${value3}    IN    @{Arrival_DT}
        ${Get_A}=    RPA.Browser.Selenium.Get Text    ${value3}
        Log To Console    ${Get_A}
        Open Workbook    Output.xlsx    Overwrite=True
        Read Worksheet    Sheet1    header=True
        Set Cell Value    ${Counter}    D    ${Get_A}
        Save Workbook
        ${Counter}=    Evaluate    ${Counter} + 1
    END

    ${Counter}=    Set Variable    2
    ${Price}=    Get WebElements    xpath=//p[@class="blackText fontSize18 blackFont white-space-no-wrap"]
    Log To Console    ${Price}
    FOR    ${value4}    IN    @{Price}
        ${Get_Price}=    RPA.Browser.Selenium.Get Text    ${value4}
        Log To Console    ${Get_Price}
        Open Workbook    Output.xlsx    Overwrite=True
        Read Worksheet    Sheet1    header=True
        Set Cell Value    ${Counter}    E    ${Get_Price}
        Save Workbook
        ${Counter}=    Evaluate    ${Counter} + 1
    END

Scraping part
    Open Workbook    Output.xlsx    Overwrite=True
    Read Worksheet    Sheet1
    Set Cell Value    1    A    Flight_Name
    Set Cell Value    1    B    Flight_code
    Set Cell Value    1    C    Dept_DT
    Set Cell Value    1    D    Arrival_DT
    Set Cell Value    1    E    Price
    Save Workbook
