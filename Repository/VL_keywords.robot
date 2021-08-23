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
#*********************************************** NavigatetoVirtualLeague  *************************************************
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

#*********************************************** LoginVirtualLeague  ******************************************************
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
    Screenshot      BetLion_Virtual League Logged in page.png

#*********************************************** VLeagueHeader ************************************************************
V-League Header
    Log to Console      V-League Header

    # Virtual League Header
    Element Should Be Enabled           ${VLeagueHomeActive}
    Wait Until Element Is Visible       ${VLeagueHeader}                10 seconds
    Click Element                       ${VLeagueHeader}
    Sleep       1
    Wait Until Element Is Enabled       ${VLeagueHeaderActive}          10 seconds
    Screenshot      BetLion_Virtual League Landing Page.png

#*********************************************** SwitchBetweenLeagues *****************************************************
Switch Between Leagues
    Log to Console      Switch Between Leagues

    # All Competitions Shown
    # Competition Selector - V-EPL
    Click Element                       ${VLeagueCompSelectorDD}
    Wait Until Element Is Visible       ${VLeagueCompSelectorDDActive}  2 seconds
    Page Should Contain Element         ${VLeagueCompSelectorDDActive}
    # V-EPL Selected by Default
    Page Should Contain Element         ${VLeagueCompVEPLSelected}
    # All Competitions Shown
    Page Should Contain Element         ${VLeagueCompVLaLiga}
    Page Should Contain Element         ${VLeagueCompVAfricanNations}
    Page Should Contain Element         ${VLeagueCompVWorldLeague}
    # Flags displayed next to competitions
    Page Should Contain Element         ${VLeagueCompVEPLFlag}
    Page Should Contain Element         ${VLeagueCompVLaLigaFlag}
    Page Should Contain Element         ${VLeagueCompVAfricanNationsFlag}
    Page Should Contain Element         ${VLeagueCompVWorldLeagueFlag}

    Screenshot      BetLion_Virtual League All Competitions Shown.png

    # Competition Selector - V-EPL
    Wait Until Element Is Visible       ${VLeagueCompVEPL}              10 seconds
    Click Element                       ${VLeagueCompVEPL}
    Sleep       1
    #Validations
        # V-EPL Teams Visible on page
    Wait Until Element Is Visible       ${VLeagueCompVEPLArsenal}           10 seconds
    Page Should Contain Element         ${VLeagueCompVEPLArsenal}
    Page Should Contain Element         ${VLeagueCompVEPLChelsea}

    Screenshot      BetLion_Virtual League V-EPL Teams Visible on page.png

    # Competition Selector - V-La Liga
    Click Element                       ${VLeagueCompSelectorDD}
    Wait Until Element Is Visible       ${VLeagueCompSelectorDDActive}  2 seconds
    Page Should Contain Element         ${VLeagueCompSelectorDDActive}
    Sleep       1
    Wait Until Element Is Visible       ${VLeagueCompVLaLiga}               10 seconds
    Click Element                       ${VLeagueCompVLaLiga}
    Sleep       1
    #Validations
        # V-La Liga Teams Visible on page
    Wait Until Element Is Visible       ${VLeagueCompVLaLigaAtleticoMadrid}           10 seconds
    Page Should Contain Element         ${VLeagueCompVLaLigaAtleticoMadrid}
    Page Should Contain Element         ${VLeagueCompVLaLigaBarcelona}

    Screenshot      BetLion_Virtual League V-La Liga Teams Visible on page.png

    # Competition Selector - V-African Nations
    Click Element                       ${VLeagueCompSelectorDD}
    # V-La Liga Selected
    Page Should Contain Element         ${VLeagueCompVLaLigaSelected}
    Sleep       1
    Wait Until Element Is Visible       ${VLeagueCompVAfricanNations}   10 seconds
    Click Element                       ${VLeagueCompVAfricanNations}
    Sleep       1
    #Validations
        # V-African Nations Teams Visible on page
    Wait Until Element Is Visible       ${VLeagueCompVAfricanNationsSouthAfrica}           10 seconds
    Page Should Contain Element         ${VLeagueCompVAfricanNationsSouthAfrica}
    Page Should Contain Element         ${VLeagueCompVAfricanNationsCameroon}

    Screenshot      BetLion_Virtual League V-African Nations Teams Visible on page.png

    # Competition Selector - V-World League
    Click Element                       ${VLeagueCompSelectorDD}
    # V-World League Selected
    Page Should Contain Element         ${VLeagueCompVAfricanNationsSelected}
    Sleep       1
    Wait Until Element Is Visible       ${VLeagueCompVWorldLeague}      10 seconds
    Click Element                       ${VLeagueCompVWorldLeague}
    Sleep       1
    #Validations
        # V-World League Teams Visible on page
    Wait Until Element Is Visible       ${VLeagueCompVWorldLeagueEngland}           10 seconds
    Page Should Contain Element         ${VLeagueCompVWorldLeagueEngland}
    Page Should Contain Element         ${VLeagueCompVWorldLeagueBelgium}

    Screenshot      BetLion_Virtual League V-World League Teams Visible on page.png
















