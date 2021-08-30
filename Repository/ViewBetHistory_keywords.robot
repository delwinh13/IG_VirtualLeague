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

    Log to Console      View Virtual League Table

    # Click Table Tab
    Log to Console      Click Table Tab
    Element Should Be Enabled           ${VLeagueTableTab}
    Click Element                       ${VLeagueTableTab}
    Page Should Contain Element         ${VLeagueTableTabActive}

    ##Table shows all teams
    Log to Console      Table shows all teams
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

    Screenshot      BetLion_View Virtual League Table.png

#*********************************************** ViewBetHistoryVirtualGame ************************************************
View Virtual League Bet History

    View Virtual League Table

    Log to Console      View Virtual League Bet History

    # Scroll Down
    Log to Console      Scroll Down
    Sleep   1
    Unselect Frame
    Execute JavaScript    window.scrollTo(0,300)
    Select Frame                        ${iFrame}
    Sleep   1

    # Click Bet History
    Log to Console      Click Bet History
    Wait Until Element Is Visible       ${VLeagueBetHistory}                10 seconds
    Click Element                       ${VLeagueBetHistory}

    ## Validations
    Log to Console      Validations - Header_Bet Table_Accumulator_Table Result = Lost
        #Header
    Wait Until Element Is Visible       ${VLeagueBetHistoryHeader}          10 seconds
    Screenshot      BetLion_View Virtual League Bet History.png

    Page Should Contain Element         ${VLeagueBetHistoryHeader}
        #Bet Table
    Page Should Contain Element         ${VLeagueBetHistoyTable}
        #Accumulator
    Page Should Contain Element         ${VLeagueBetHistoryAccumulator}
        #Table Result = Lost
    Page Should Contain Element         ${VLeagueBetHistoryTableLost}

    # Bet History table displayed with 9 completed matches
    Log to Console      Bet History table displayed with 9 completed matches
    Wait Until Element Is Visible       ${VLeagueBetHistoryTableFixtures}            30 seconds
    ${countBetHistory}=   Get Element Count       ${VLeagueBetHistoryTableFixtures}
    Should Be Equal As Integers         ${countBetHistory}    9
    Log to Console      Bet History Count = ${countBetHistory}

    # Scroll Down
    Log to Console      Scroll Down
    Sleep   1
    Unselect Frame
    Execute JavaScript    window.scrollTo(0,400)
    Select Frame                        ${iFrame}
    Sleep   1

        #Total odds, stake and potential return displayed
    Log to Console      Total odds, stake and potential return displayed
    Wait Until Element Is Visible       ${VLeagueBetHistoryTableTotalOdds}            10 seconds
    Page Should Contain Element         ${VLeagueBetHistoryTableTotalOdds}
    Page Should Contain Element         ${VLeagueBetHistoryTableTotalStake}
    Page Should Contain Element         ${VLeagueBetHistoryTablePotReturn}

        #Potential return set to 0 if loss
    Log to Console      Potential return set to 0 if loss
    Page Should Contain Element         ${VLeagueBetHistoryTablePotReturnLost_0}

        #Next button available
    Log to Console      Next button available
    Page Should Contain Element         ${VLeagueBetHistoryNextBtn}
    Element Should Be Enabled           ${VLeagueBetHistoryNextBtn}

    # Scroll to bottom of page
    Log to Console      Scroll to bottom of page
    Sleep   1
    Unselect Frame
    Execute JavaScript    window.scrollTo(0,1000)
    Select Frame                        ${iFrame}
    Sleep   1

    # Next Button
    Log to Console      Next Button
    Wait Until Element Is Visible       ${VLeagueBetHistoryNextBtn}         10 seconds
    Click Element                       ${VLeagueBetHistoryNextBtn}
    Sleep   3

    # Scroll to bottom of page
    Log to Console      Scroll to bottom of page
    Sleep   1
    Unselect Frame
    Execute JavaScript    window.scrollTo(0,1400)
    Select Frame                        ${iFrame}
    Sleep   1

    #Previous / Next buttons available
    Log to Console      Previous / Next buttons available
    Page Should Contain Element         ${VLeagueBetHistoryNextBtn}
    Page Should Contain Element         ${VLeagueBetHistoryPreviousBtn}
    Element Should Be Enabled           ${VLeagueBetHistoryNextBtn}
    Element Should Be Enabled           ${VLeagueBetHistoryPreviousBtn}

    # Next Button
    Log to Console      Next Button
    Wait Until Element Is Visible       ${VLeagueBetHistoryNextBtn}         10 seconds
    Click Element                       ${VLeagueBetHistoryNextBtn}
    Sleep   3

    # Scroll to bottom of page
    Log to Console      Scroll to bottom of page
    Sleep   1
    Unselect Frame
    Execute JavaScript    window.scrollTo(0,1000)
    Select Frame                        ${iFrame}
    Sleep   1

    #Previous button
    Log to Console      Previous button
    Wait Until Element Is Visible       ${VLeagueBetHistoryPreviousBtn}     10 seconds
    Click Element                       ${VLeagueBetHistoryPreviousBtn}
    Sleep   3

    # Scroll to top of page
    Log to Console      Scroll to top of page
    Sleep   1
    Unselect Frame
    Execute JavaScript    window.scrollTo(0,-1400)
    Select Frame                        ${iFrame}
    Sleep   1

    Screenshot      BetLion_View Virtual League Bet History.png













