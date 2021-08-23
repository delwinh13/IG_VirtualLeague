*** Settings ***
Documentation    Watch Live Virtual Game
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
#*********************************************** WatchLiveVirtualGame *****************************************************
Watch Live Virtual Game

    Log to Console      Watch Live Virtual Game

    # Scroll to the top of the page
    Sleep   1
    Unselect Frame
    Execute JavaScript    window.scrollTo(0,-400)
    Select Frame                        ${iFrame}
    Sleep   1

    # Wait until Live Tab Selected and Active
    Log to Console      Wait until Live Tab Selected and Active
    Wait Until Element Is Visible       ${VLeagueLiveTabActive}                 150 seconds
    Sleep   2

    # Bet Now visible then removed
    Log to Console      Bet Now visible then removed
    Wait Until Element Is Not Visible   ${VLeagueLiveBetNowBtn}                 20 seconds

    # League, Season, Week visible
    Log to Console      League, Season, Week visible
    Page Should Contain Element         ${VLeagueLiveVEPLLeague}
    Page Should Contain Element         ${VLeagueLiveSeason}
    Page Should Contain Element         ${VLeagueLiveWeek}

    # 1st Half visible
    Log to Console      1st Half visible
    Page Should Contain Element         ${VLeagueLive1stHalf}

    # Game Timer = 45 minutes
    Log to Console      Game Timer = 45 minutes
    Wait Until Element Is Visible       ${VLeagueLiveGameTime1stBlock4}                 30 seconds
    Wait Until Element Is Visible       ${VLeagueLiveGameTime2ndBlock5}                 30 seconds

    # 2nd Half visible
    Log to Console      2nd Half visible
    Wait Until Element Is Visible       ${VLeagueLive2ndHalf}                   30 seconds
    Page Should Contain Element         ${VLeagueLive2ndHalf}

    # Game Timer = 89 minutes
    Log to Console      Game Timer = 89 minutes
    Wait Until Element Is Visible       ${VLeagueLiveGameTime1stBlock8}                 30 seconds
    Wait Until Element Is Visible       ${VLeagueLiveGameTime2ndBlock9}                 30 seconds
    Sleep   2

    Screenshot      BetLion_Virtual League Live Game Watched.png


