*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    RequestsLibrary
Library    JSONLibrary
Library    XML

*** Variables ***
${URL}    https://www.raja.fr/
${error_champ}    Information obligatoire



*** Keywords ***
Page Raja
    Open Browser    ${URL}    chrome
    Click Button    //html/body/div[4]/div[2]/button

Page de connexion
    Click Button    //*[@id="dropdown-account"]/button
    Click Button    //*[@id="dropdownConnexion"]/div[3]/button
    
Message d'erreur
    ${msg_error1}    Get Text    //fieldset/div[1]/label
    ${msg_error2}    Get Text    //fieldset/div[2]/label
    Should Be Equal    ${error_champ}    ${msg_error1}
    Should Be Equal    ${error_champ}    ${msg_error2}