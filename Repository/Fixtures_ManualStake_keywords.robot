*** Settings ***
Documentation    Select fixtures and submit bet with Manual Stake
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
#*********************************************** SelectFixtureswithManualStake ********************************************
Select Fixtures with Manual Stake

    V-League Header

    Log to Console      Select Fixtures with Manual Stake

    Select Frame                        ${iFrame}
    Sleep       1

    #Validations
        # Next Start Timer
    Wait Until Element Is Visible       ${VLeagueNextStartTimer}                10 seconds
    Element Should Be Enabled           ${VLeagueNextStartTimer}

        # Competition Selector
    Element Should Be Enabled           ${VLeagueCompSelectorDD}

        # League Table Button
    Element Should Be Enabled           ${VLeagueTableTab}

        # Betslip Button Disabled
    Element Should Be Visible           ${VLeagueBetslip}

        # Matches Tab Highlighted by Default
    Element Should Be Enabled          ${VLeagueMatchesTab}

        # Live Tab Enabled
    Element Should Be Enabled           ${VLeagueLiveTab}

        # Results Tab Enabled
    Element Should Be Enabled           ${VLeagueResultsTab}

        # Bonus Bar Displayed = 0%
    SeleniumLibrary.Element Text Should Be               ${VLeague0Bonus}                0%

        # 0 Selected
    SeleniumLibrary.Element Text Should Be               ${VLeagueSelected}              0

        # Market Menu Items
            #1 X 2
    Element Should Be Enabled           ${VLeague1X2MenuItem}
            #GG
    Element Should Be Enabled           ${VLeagueGGMenuItem}
            #0/U 2.5
    Element Should Be Enabled           ${VLeague0U25MenuItem}
            #DC
    Element Should Be Enabled           ${VLeagueDCMenuItem}

        # Match table displayed with 10 matches
    ${countMatches}=   Get Element Count       ${VLeagueMatchTableRows}
    Should Be Equal As Integers         ${countMatches}    10
    Log to Console      Match Table Count = ${countMatches}

    Screenshot      BetLion_Virtual League Landing Validations.png

    Switch Between Leagues

    # Competition Selector - V-EPL
    Click Element                       ${VLeagueCompSelectorDD}
    Sleep       1
    Wait Until Element Is Visible       ${VLeagueCompVEPL}                10 seconds
    Click Element                       ${VLeagueCompVEPL}
    Sleep       1

    # Matches
    Click Element                       ${VLeagueMatchesTab}
    Element Should Be Enabled           ${VLeagueMatchesTab}

    # Betslip Inactive
    Element Should Be Visible           ${VLeagueBetslipInactive}
    # Bonus Progress = 0
    Element Should Be Visible           ${VLeagueBonusProgress0}
    # Bonus = 0%
    Element Should Be Visible           ${VLeagueBonus%_0}

    #Select Fixtures
    # Match #1
    Wait Until Element Is Visible       ${VLeagueMatchBet1Inactive_1}                10 seconds
    Mouse Over                          ${VLeagueMatchBet1Inactive_1}
    Click Element                       ${VLeagueMatchBet1Inactive_1}

    # Betslip Active = 1
    Element Should Be Visible           ${VLeagueBetslipActive1}
    # Bonus Progress = 1
    Element Should Be Visible           ${VLeagueBonusProgress1}
    # Bonus % = 1
    Element Should Be Visible           ${VLeagueBonus%_1}
    # 1 Selected
    SeleniumLibrary.Element Text Should Be               ${VLeagueSelected}             1

    Screenshot      BetLion_VLeague 1 Fixture Bet Selected.png

    # Match #2
    Wait Until Element Is Visible       ${VLeagueMatchBet2Inactive_X}                10 seconds
    Mouse Over                          ${VLeagueMatchBet2Inactive_X}
    Click Element                       ${VLeagueMatchBet2Inactive_X}

    # Betslip Active = 2
    Element Should Be Visible           ${VLeagueBetslipActive2}
    # Bonus Progress = 2
    Element Should Be Visible           ${VLeagueBonusProgress2}
    # Bonus % = 2
    Element Should Be Visible           ${VLeagueBonus%_2}
    # 2 Selected
    SeleniumLibrary.Element Text Should Be               ${VLeagueSelected}             2

    Screenshot      BetLion_VLeague 2 Fixture Bet Selected.png

    # Match #3
    Wait Until Element Is Visible       ${VLeagueMatchBet3Inactive_2}                10 seconds
    Mouse Over                          ${VLeagueMatchBet3Inactive_2}
    Click Element                       ${VLeagueMatchBet3Inactive_2}

    # Betslip Active = 3
    Element Should Be Visible           ${VLeagueBetslipActive3}
    # Bonus Progress = 3
    Element Should Be Visible           ${VLeagueBonusProgress3}
    # Bonus % = 3
    Element Should Be Visible           ${VLeagueBonus%_3}
    # 3 Selected
    SeleniumLibrary.Element Text Should Be               ${VLeagueSelected}             3

    # Match #4
    Wait Until Element Is Visible       ${VLeagueMatchBet4Inactive_X}                10 seconds
    Mouse Over                          ${VLeagueMatchBet4Inactive_X}
    Click Element                       ${VLeagueMatchBet4Inactive_X}

    # Betslip Active = 4
    Element Should Be Visible           ${VLeagueBetslipActive4}
    # Bonus Progress = 4
    Element Should Be Visible           ${VLeagueBonusProgress4}
    # Bonus % = 4
    Element Should Be Visible           ${VLeagueBonus%_4}
    # 4 Selected
    SeleniumLibrary.Element Text Should Be               ${VLeagueSelected}             4

    # Match #5
    Wait Until Element Is Visible       ${VLeagueMatchBet5Inactive_1}                10 seconds
    Mouse Over                          ${VLeagueMatchBet5Inactive_1}
    Click Element                       ${VLeagueMatchBet5Inactive_1}

    # Betslip Active = 5
    Element Should Be Visible           ${VLeagueBetslipActive5}
    # Bonus Progress = 5
    Element Should Be Visible           ${VLeagueBonusProgress5}
    # Bonus % = 5
    Element Should Be Visible           ${VLeagueBonus%_5}
    # 5 Selected
    SeleniumLibrary.Element Text Should Be               ${VLeagueSelected}             5

    # Match #6
    Wait Until Element Is Visible       ${VLeagueMatchBet6Inactive_X}                10 seconds
    Mouse Over                          ${VLeagueMatchBet6Inactive_X}
    Click Element                       ${VLeagueMatchBet6Inactive_X}

    # Betslip Active = 6
    Element Should Be Visible           ${VLeagueBetslipActive6}
    # Bonus Progress = 6
    Element Should Be Visible           ${VLeagueBonusProgress6}
    # Bonus % = 6
    Element Should Be Visible           ${VLeagueBonus%_6}
    # 6 Selected
    SeleniumLibrary.Element Text Should Be               ${VLeagueSelected}             6

    # Match #7
    Wait Until Element Is Visible       ${VLeagueMatchBet7Inactive_2}                10 seconds
    Mouse Over                          ${VLeagueMatchBet7Inactive_2}
    Click Element                       ${VLeagueMatchBet7Inactive_2}

    # Betslip Active = 7
    Element Should Be Visible           ${VLeagueBetslipActive7}
    # Bonus Progress = 7
    Element Should Be Visible           ${VLeagueBonusProgress7}
    # Bonus % = 7
    Element Should Be Visible           ${VLeagueBonus%_7}
    # 7 Selected
    SeleniumLibrary.Element Text Should Be               ${VLeagueSelected}             7

    # Match #8
    Wait Until Element Is Visible       ${VLeagueMatchBet8Inactive_X}                10 seconds
    Mouse Over                          ${VLeagueMatchBet8Inactive_X}
    Click Element                       ${VLeagueMatchBet8Inactive_X}

    # Betslip Active = 8
    Element Should Be Visible           ${VLeagueBetslipActive8}
    # Bonus Progress = 8
    Element Should Be Visible           ${VLeagueBonusProgress8}
    # Bonus % = 8
    Element Should Be Visible           ${VLeagueBonus%_8}
    # 8 Selected
    SeleniumLibrary.Element Text Should Be               ${VLeagueSelected}             8

    Sleep   1
    Unselect Frame
    Execute JavaScript    window.scrollTo(0,500)
    Select Frame                        ${iFrame}
    Sleep   1

    # Match #9
    Wait Until Element Is Visible       ${VLeagueMatchBet9Inactive_1}                10 seconds
    Mouse Over                          ${VLeagueMatchBet9Inactive_1}
    Click Element                       ${VLeagueMatchBet9Inactive_1}

    # Betslip Active = 9
    Element Should Be Visible           ${VLeagueBetslipActive9}
    # Bonus Progress = 9
    Element Should Be Visible           ${VLeagueBonusProgress9}
    # Bonus % = 9
    Element Should Be Visible           ${VLeagueBonus%_9}
    # 9 Selected
    SeleniumLibrary.Element Text Should Be               ${VLeagueSelected}             9

    # Match #10
    Wait Until Element Is Visible       ${VLeagueMatchBet10Inactive_X}                10 seconds
    Mouse Over                          ${VLeagueMatchBet10Inactive_X}
    Click Element                       ${VLeagueMatchBet10Inactive_X}

    Sleep   1
    Unselect Frame
    Execute JavaScript    window.scrollTo(0,-500)
    Select Frame                        ${iFrame}
    Sleep   1

    # Betslip Active = 10
    Element Should Be Visible           ${VLeagueBetslipActive10}
    # Bonus Progress = 10
    Element Should Be Visible           ${VLeagueBonusProgress10}
    # Bonus % = 10
    Element Should Be Visible           ${VLeagueBonus%_10}
    # 10 Selected
    SeleniumLibrary.Element Text Should Be               ${VLeagueSelected}             10
    Screenshot      BetLion_Virtual League 10 Bets_Bonus Max%.png

    Sleep   1
    Unselect Frame
    Execute JavaScript    window.scrollTo(0,800)
    Select Frame                        ${iFrame}
    Sleep   1

    # BetSlip Row displayed with 10 matches
    ${countBetslipRows}=   Get Element Count       ${VLeagueBetslipRows}
    Should Be Equal As Integers         ${countBetslipRows}     10
    Log to Console      BetSlip Row Count = ${countBetslipRows}

    ##Click 'x' on a fixture in the betslip
    # Deselect Row 1 Bet
    Wait Until Element Is Visible       ${VLeagueBetslipBetRow1Cancel}                10 seconds
    Click Element                       ${VLeagueBetslipBetRow1Cancel}
    Sleep   1

    # BetSlip Row displayed with 9 matches
    ${countBetslipRows}=   Get Element Count       ${VLeagueBetslipRows}
    Should Be Equal As Integers         ${countBetslipRows}     9
    Log to Console      BetSlip Row Count = ${countBetslipRows}

    Sleep   1
    Unselect Frame
    Execute JavaScript    window.scrollTo(0,-800)
    Select Frame                        ${iFrame}
    Sleep   1

    # Validations with 1 Bet removed
    Element Should Be Enabled           ${VLeagueMatchBet1Inactive_1}
    # Betslip Active = 9
    Element Should Be Visible           ${VLeagueBetslipActive9}
    # Bonus Progress = 9
    Element Should Be Visible           ${VLeagueBonusProgress9}
    # Bonus % = 9
    Element Should Be Visible           ${VLeagueBonus%_9}
    # 9 Selected
    SeleniumLibrary.Element Text Should Be               ${VLeagueSelected}             9
    Screenshot      BetLion_Virtual League 9 Bets_Bonus Not Max%.png

    ##Select an autostake
    Sleep   1
    Unselect Frame
    Execute JavaScript    window.scrollTo(0,1000)
    Select Frame                        ${iFrame}
    Sleep   1

    # Select KSh20 AutoStake
    # KSh Total Empty
    Page Should Contain Element         ${VLeagueBetslipInputValue0}
    # To Win / Stake Tax / Winnings Tax / Total Potential Return = 0
    SeleniumLibrary.Element Text Should Be               ${VLeagueBetslipToWin}             KSh 0.00
    SeleniumLibrary.Element Text Should Be               ${VLeagueBetslipStakeTax}          KSh 0.00
    SeleniumLibrary.Element Text Should Be               ${VLeagueBetslipWinTax}            KSh 0.00
    SeleniumLibrary.Element Text Should Be               ${VLeagueBetslipTotalReturn}       KSh 0.00
    # Select KSh20 AutoStake
    Wait Until Element Is Visible       ${VLeagueBetslipKSh20}                      10 seconds
    Click Element                       ${VLeagueBetslipKSh20}
    Page Should Contain Element         ${VLeagueBetslipInputValue20}

    # To Win > 0
#    Page Should Not Contain Element         ${VLeagueBetslipToWin0}
#    Page Should Not Contain Element         ${VLeagueBetslipStakeTax0}
#    Page Should Not Contain Element         ${VLeagueBetslipWinTax0}
#    Page Should Not Contain Element         ${VLeagueBetslipTotalReturn0}
    Screenshot      BetLion_Virtual League To Win_Stake Tax_Winnings Tax_Total Potential Return_Calculated.png

    ##Click Bet Now
    Page Should Contain Element         ${VLeagueBetNow}
    Click Element                       ${VLeagueBetNow}
    Sleep   1
    # Validations - Bet Placed Successfully
    Wait Until Element Is Visible       ${VLeagueBetPlacedSuccessfully}                10 seconds
    # Bet Status
    Page Should Contain Element         ${VLeagueBetStatusOpen}
    # Chosen fixtures displayed
    ${countBetsReceiptRows}=   Get Element Count       ${VLeagueBetsReceiptRows}
    Should Be Equal As Integers         ${countBetslipRows}     9
    Log to Console      BetSlip Row Count = ${countBetsReceiptRows}

    Sleep   1
    Unselect Frame
    Execute JavaScript    window.scrollTo(0,400)
    Select Frame                        ${iFrame}
    Sleep   1

    # Stake and outcome displayed
    SeleniumLibrary.Element Text Should Not Be          ${VLeagueBetsReceiptTotalOdds}          0.00
    SeleniumLibrary.Element Text Should Be              ${VLeagueBetsReceiptTotalStake}         KSh20.00
    SeleniumLibrary.Element Text Should Not Be          ${VLeagueBetsTotalPotentialReturn}      0.00

    ##Option to play more or view history
    # Reuse Selections
    Page Should Contain Element         ${VLeagueBetsReuseSelections}
    Element Should Be Enabled           ${VLeagueBetsReuseSelections}
    # Back to Matches
    Page Should Contain Element         ${VLeagueBetsBacktoMatches}
    Element Should Be Enabled           ${VLeagueBetsBacktoMatches}
    # Bet History
    Page Should Contain Element         ${VLeagueBetsBetHistory}
    Element Should Be Enabled           ${VLeagueBetsBetHistory}
    Screenshot      BetLion_Virtual League Bet Placed_Odds Stakes Visible_Reuse Selections Back to Matches Buttons.png