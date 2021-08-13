*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
#Library     XML
Library     String
Library     Process
#Library     SwingLibrary
Resource    ../Resources/VL_vars.robot
Resource    ../Repository/Common_keywords.robot
Library     DateTime


*** Keywords ***
#*********************************************** LoginVirtualLeague  ******************************************************
Navigate to Virtual League
    Log to Console          Navigate to Virtual League
    Open Browser                        ${VLURL}  ${BROWSER}
    Set Selenium Implicit Wait          10 seconds
    Maximize Browser Window
#    Title Should Be                     https://staging.betlion.ke/home/virtualleague
    Sleep       1
    Log to Console         Virtual League
    Wait Until Element Is Enabled       ${BetLionLogoXpath}             10 seconds
    ${Date} =  Get DateTime
    Set Global Variable  ${Path}  ${EXECDIR}${/}..\\IG_VirtualLeague\\Results\\Screenshots\\IG_VirtualLeague\\${Date}

Login to Virtual League
    Log to Console          Login to Virtual League

    Element Should Be Enabled           ${HomeLoginBtnXpath}
    Sleep       1

    # Click Allow Notifications
    Unselect Frame
    Wait Until Element Is Enabled       ${AllowNotificationsBtnXpath}   10 seconds
    Click Element                       ${AllowNotificationsBtnXpath}
    Sleep       1

    # Welcome Message
    Select Frame                        ${iFrame}
    Wait Until Element Is Enabled       ${WelcomePlayNowBtn}            10 seconds
    Click Element                       ${WelcomePlayNowBtn}
    Sleep       1
    Unselect Frame

    # Click Home Login Button
    Click Element                       ${HomeLoginBtnXpath}
    Sleep       1
    Wait Until Element Is Enabled       ${MobileNoID}                   10 seconds

    # Login Blank Mobile Number and PIN
    Click Element                       ${LoginBtnXpath}
    Sleep       1
    Page Should Contain Element          ${BlankCredentialsMsg}

    # Enter Mobile Number Only
    Input Text                          ${MobileNoID}                   742343912
    Click Element                       ${LoginBtnXpath}
    Sleep       1
    Page Should Contain Element          ${BlankCredentialsMsg}
    Clear Element Text                  ${MobileNoID}

    # Enter PIN Only
    Input Text                          ${PinID}                        1111
    Click Element                       ${LoginBtnXpath}
    Sleep       1
    Page Should Contain Element          ${BlankCredentialsMsg}
    Clear Element Text                  ${PinID}

    # Enter Invalid Mobile Number and PIN
    Input Text                          ${MobileNoID}                   881659001
    Input Text                          ${PinID}                        9865

    # Click Login Button
    Click Element                       ${LoginBtnXpath}
    Sleep       1
    Page Should Contain Element          ${InvalidCredentialsMsg}
    Sleep       1
    Clear Element Text                  ${MobileNoID}
    Clear Element Text                  ${PinID}
    Sleep       1

    # Enter Valid Mobile Number and PIN
    Input Text                          ${MobileNoID}                   742343912
    Input Text                          ${PinID}                        1111

    # Click Login Button
    Click Element                       ${LoginBtnXpath}
    Sleep       1

    Wait Until Element Is Enabled       ${DepositBtnXpath}              10 seconds
    Screenshot      BetLion_Virtual League Logged in page-{index}

V-League Header
    Log to Console      V-League Header

    # Virtual League Header
    Element Should Be Enabled           ${VLeagueHomeActive}
    Wait Until Element Is Visible       ${VLeagueHeader}                10 seconds
    Click Element                       ${VLeagueHeader}
    Sleep       1
    Wait Until Element Is Enabled       ${VLeagueHeaderActive}          10 seconds
    Screenshot      BetLion_Virtual League Landing Page-{index}.png

Select Fixtures with Autostake

    V-League Header

    Log to Console      Select Fixtures with Autostake

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
    ${count}=   Get Element Count       ${VLeagueMatchTableRows}
    Should Be Equal As Integers         ${count}    10
    Log to Console      Match Table Count = ${count}

    Screenshot      BetLion_Virtual League Landing Validations-{index}.png

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

    Screenshot      BetLion_VLeague 1 Fixture Bet Selected-{index}.png

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

    Screenshot      BetLion_VLeague 2 Fixture Bet Selected-{index}.png

    # Match #3
    Wait Until Element Is Visible       ${VLeagueMatchBet3Inactive_2}                10 seconds
    Mouse Over                          ${VLeagueMatchBet3Inactive_2}
    Click Element                       ${VLeagueMatchBet3Inactive_2}

    # Betslip Active = 2
    Element Should Be Visible           ${VLeagueBetslipActive3}
    # Bonus Progress = 2
    Element Should Be Visible           ${VLeagueBonusProgress3}
    # Bonus % = 2
    Element Should Be Visible           ${VLeagueBonus%_3}
    # 2 Selected
    SeleniumLibrary.Element Text Should Be               ${VLeagueSelected}             3

    # Match #4
    Wait Until Element Is Visible       ${VLeagueMatchBet4Inactive_X}                10 seconds
    Mouse Over                          ${VLeagueMatchBet4Inactive_X}
    Click Element                       ${VLeagueMatchBet4Inactive_X}

    # Betslip Active = 2
    Element Should Be Visible           ${VLeagueBetslipActive4}
    # Bonus Progress = 2
    Element Should Be Visible           ${VLeagueBonusProgress4}
    # Bonus % = 2
    Element Should Be Visible           ${VLeagueBonus%_4}
    # 2 Selected
    SeleniumLibrary.Element Text Should Be               ${VLeagueSelected}             4

    # Match #5
    Wait Until Element Is Visible       ${VLeagueMatchBet5Inactive_1}                10 seconds
    Mouse Over                          ${VLeagueMatchBet5Inactive_1}
    Click Element                       ${VLeagueMatchBet5Inactive_1}

    # Betslip Active = 2
    Element Should Be Visible           ${VLeagueBetslipActive5}
    # Bonus Progress = 2
    Element Should Be Visible           ${VLeagueBonusProgress5}
    # Bonus % = 2
    Element Should Be Visible           ${VLeagueBonus%_5}
    # 2 Selected
    SeleniumLibrary.Element Text Should Be               ${VLeagueSelected}             5

    # Match #6
    Wait Until Element Is Visible       ${VLeagueMatchBet6Inactive_X}                10 seconds
    Mouse Over                          ${VLeagueMatchBet6Inactive_X}
    Click Element                       ${VLeagueMatchBet6Inactive_X}

    # Betslip Active = 2
    Element Should Be Visible           ${VLeagueBetslipActive6}
    # Bonus Progress = 2
    Element Should Be Visible           ${VLeagueBonusProgress6}
    # Bonus % = 2
    Element Should Be Visible           ${VLeagueBonus%_6}
    # 2 Selected
    SeleniumLibrary.Element Text Should Be               ${VLeagueSelected}             6

    # Match #7
    Wait Until Element Is Visible       ${VLeagueMatchBet7Inactive_2}                10 seconds
    Mouse Over                          ${VLeagueMatchBet7Inactive_2}
    Click Element                       ${VLeagueMatchBet7Inactive_2}

    # Betslip Active = 2
    Element Should Be Visible           ${VLeagueBetslipActive7}
    # Bonus Progress = 2
    Element Should Be Visible           ${VLeagueBonusProgress7}
    # Bonus % = 2
    Element Should Be Visible           ${VLeagueBonus%_7}
    # 2 Selected
    SeleniumLibrary.Element Text Should Be               ${VLeagueSelected}             7

    # Match #8
    Wait Until Element Is Visible       ${VLeagueMatchBet8Inactive_X}                10 seconds
    Mouse Over                          ${VLeagueMatchBet8Inactive_X}
    Click Element                       ${VLeagueMatchBet8Inactive_X}

    # Betslip Active = 2
    Element Should Be Visible           ${VLeagueBetslipActive8}
    # Bonus Progress = 2
    Element Should Be Visible           ${VLeagueBonusProgress8}
    # Bonus % = 2
    Element Should Be Visible           ${VLeagueBonus%_8}
    # 2 Selected
    SeleniumLibrary.Element Text Should Be               ${VLeagueSelected}             8

    Scroll Element Into View            ${VLeagueBetFromInput}
    Sleep   1

    # Match #9
    Wait Until Element Is Visible       ${VLeagueMatchBet9Inactive_1}                10 seconds
    Mouse Over                          ${VLeagueMatchBet9Inactive_1}
    Click Element                       ${VLeagueMatchBet9Inactive_1}

    # Betslip Active = 2
    Element Should Be Visible           ${VLeagueBetslipActive9}
    # Bonus Progress = 2
    Element Should Be Visible           ${VLeagueBonusProgress9}
    # Bonus % = 2
    Element Should Be Visible           ${VLeagueBonus%_9}
    # 2 Selected
    SeleniumLibrary.Element Text Should Be               ${VLeagueSelected}             9

    # Match #10
    Wait Until Element Is Visible       ${VLeagueMatchBet10Inactive_X}                10 seconds
    Mouse Over                          ${VLeagueMatchBet10Inactive_X}
    Click Element                       ${VLeagueMatchBet10Inactive_X}

    # Betslip Active = 2
    Element Should Be Visible           ${VLeagueBetslipActive10}
    # Bonus Progress = 2
    Element Should Be Visible           ${VLeagueBonusProgress10}
    # Bonus % = 2
    Element Should Be Visible           ${VLeagueBonus%_10}
    # 2 Selected
    SeleniumLibrary.Element Text Should Be               ${VLeagueSelected}             10








