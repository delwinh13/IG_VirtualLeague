*** Settings ***
Documentation    View Virtual League Bet History
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
#*********************************************** ViewVirtualLeagueTable ***************************************************
View Virtual League Table

    Log to Console      View Virtual League Bet History

    # Click Table Tab
    Log to Console      Click Table Tab
    Element Should Be Enabled           ${VLeagueTableTab}
    Click Element                       ${VLeagueTableTab}
    Page Should Contain Element         ${VLeagueTableTabActive}

    ##Table shows all teams
    # V-EPL Teams Visible on page
    Wait Until Element Is Visible       ${VLeagueTableVEPLArsenal}           10 seconds
    Page Should Contain Element         ${VLeagueTableVEPLArsenal}
    Page Should Contain Element         ${VLeagueTableVEPLChelsea}

    # League, Season, Week visible
    Log to Console      League, Season, Week visible
    Page Should Contain Element         ${VLeagueTableVEPLLeague}
    Page Should Contain Element         ${VLeagueTableSeason}
    Page Should Contain Element         ${VLeagueTableWeek}

    # Wins, draws, losses and points in header of table
    Log to Console      Wins, draws, losses and points in header of table
    Page Should Contain Element         ${VLeagueTableHeaderW}
    Page Should Contain Element         ${VLeagueTableHeaderD}
    Page Should Contain Element         ${VLeagueTableHeaderL}
    Page Should Contain Element         ${VLeagueTableHeaderPTS}


#*********************************************** ViewBetHistoryVirtualGame ************************************************
View Virtual League Bet History

    View Virtual League Table

    Log to Console      View Virtual League Bet History

