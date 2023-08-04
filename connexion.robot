*** Settings ***
Library    OperatingSystem
Library    Collections
Library    SeleniumLibrary
Library    XML
Resource  TestConnexionChampsManquants.robot
Resource  TestConnexionPassent.robot


*** Variables ***
${messageErreurLogin}  
*** Test Cases ***
Connexion
    OpenRaja
    ConecteAsUser

ConnexionDataInvalide
    ConexionInvalide

ConnexionNoData
    Page Raja
    Page de connexion
    Message d'erreur


*** Keywords *** 
ConexionInvalide
    Open Browser    https://www.raja.fr    chrome
    CLick Element   //html/body/div[4]/div[2]/button
    Click Button    xpath=//*[@id="dropdown-account"]/button
    Input Text      xpath=//*[@id="UserLoginDropdown"]    rebeccaperry@example.org
    Input Text      xpath=//*[@id="UserPasswordDropdown"]    password
    CLick Element    xpath=//*[@id="dropdownConnexion"]/div[3]/button
    Sleep    2
    ${messageErreurLogin}   Get Text       xpath=//*[@id="dropdownConnexion"]/div[3]
    Log     ${messageErreurLogin}
    Should Contain    ${messageErreurLogin}    Couple login/mot de passe invalide
   
   Close Browser
    
    