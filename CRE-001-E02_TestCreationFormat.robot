*** Settings ***
Library  SeleniumLibrary
Library  ExcelLibrary
Library  XML
Library  FakerLibrary  locale=fr_FR
Resource  TestConnexionPassent.robot
Resource  CRE-001-N01-Creation-Profil-Success.robot
Test Setup  OpenRaja

*** Variables ***


*** Test Case ***
CreationWrongFormat
    Test
    


*** KeyWord ***
Test
    Click Element  //*[@id="dropdown-account"]
    Click Element  //*[@id="redirectCreateAccount"]
    Sleep    1
    Scroll to Element  //*[@id="nextStepBtn"]
    Sleep    1
    Click Element      //*[@id="nextStepBtn"]
    Log To Console     test