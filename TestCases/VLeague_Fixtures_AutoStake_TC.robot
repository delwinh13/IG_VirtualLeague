*** Settings ***
Documentation       Automation Priority List_VLeague
Library             SeleniumLibrary
Resource            ../Repository/VL_keywords.robot
Resource            ../Repository/Fixtures_AutoStake_keywords.robot
Resource            ../Repository/Live_VirtualGame_keywords.robot
Resource            ../Repository/ViewResults_keywords.robot
Resource            ../Repository/ViewBetHistory_keywords.robot
#Suite Teardown      Close Browser
Force Tags          behavior-driven

*** Test Cases ***
Automation Priority List_VLeague
#    [Tags]  PT-43  UI
    Navigate to Virtual League
    Login to Virtual League
    Select Fixtures with Auto Stake_V-EPL
    Watch Live Virtual Game
    View Virtual League Results
    View Virtual League Bet History
    Select Fixtures with Auto Stake_V-La Liga
    Select Fixtures with Auto Stake_V-African Nations
    Select Fixtures with Manual Stake_V-World League