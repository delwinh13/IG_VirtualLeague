*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/VL_vars.robot
Library     DateTime

*** Keywords ***
Get DateTime
  ${date1}=  Get Current Date  result_format=%Y-%m-%d %H-%M-%S
  [Return]     ${date1}

Screenshot
  [Arguments]  ${filename}
  Set Screenshot Directory  ${Path}
  #Wait Until Page Contains  Element
  # ${datetime}=  Get DateTime
  Capture Page Screenshot  ${filename}.${TYPE OF FILE}
  Log To Console  ${\n}Screenshot