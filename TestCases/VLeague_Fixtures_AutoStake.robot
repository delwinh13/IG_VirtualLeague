*** Settings ***
Documentation       Login to Virtual League
Library             SeleniumLibrary
Resource            ../Repository/VL_keywords.robot
#Suite Teardown      Close Browser
Force Tags          behavior-driven

*** Test Cases ***
Fixtures with Autostake
    Navigate to Virtual League
    Login to Virtual League
    Select Fixtures with Autostake