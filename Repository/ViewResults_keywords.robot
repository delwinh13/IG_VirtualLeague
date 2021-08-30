*** Settings ***
Documentation    View Virtual League Results
Library     SeleniumLibrary
#Library     XML
Library     String
Library     Process
#Library     SwingLibrary
Resource    ../Resources/VL_vars.robot
Resource    ../Repository/Common_keywords.robot
Resource    ../Repository/VL_keywords.robot
Library     DateTime


*** Keywords ***
#*********************************************** ViewResultsVirtualGame ***************************************************
View Virtual League Results

    Log to Console      View Virtual League Results

    # Wait until Results Tab Selected and Active
    Log to Console      Wait until Results Tab Selected and Active
    Wait Until Element Is Visible       ${VLeagueResultsTab}                            60 seconds

    # League, Season, Week visible
    Log to Console      League, Season, Week visible
    Page Should Contain Element         ${VLeagueLiveVEPLLeague}
    Page Should Contain Element         ${VLeagueLiveSeason}
    Page Should Contain Element         ${VLeagueLiveWeek}

    # FT in space where match time is displayed
    Log to Console      FT in space where match time is displayed
    Page Should Contain Element         ${VLeagueResultsFT_F}
    Page Should Contain Element         ${VLeagueResultsFT_T}

    # "Bet Next" button available at right side
    Log to Console      "Bet Next" button available at right side
    Page Should Contain Element         ${VLeagueResultsBetNextBtn}

    # Match table displayed with 9 highlighted matches
    Log to Console      Match table displayed with 9 highlighted matches
    Wait Until Element Is Visible       ${VLeagueResultsMatchTableFixtures}             30 seconds
    ${countMatches}=   Get Element Count       ${VLeagueResultsMatchTableFixtures}
    Should Be Equal As Integers         ${countMatches}    9
    Log to Console      Match Table Count = ${countMatches}

    Screenshot      BetLion_Virtual League Results Tab.png








