*** Settings ***
Library    SeleniumLibrary
Library  ExcelLibrary
Library    XML

*** Variables ***

*** Test Case ***
Connexion Passente
    OpenRaja
    ConecteAsUser


*** KeyWord ***
OpenRaja
    Open Browser  https://www.raja.fr  chrome
    Click Button  xpath=/html/body/div[4]/div[2]/button

ConecteAsUser
    Click Element  //*[@id="dropdown-account"]

    Open Excel Document  RajaJDD__300__0.xlsx  toto
    ${pseudo}  Read Excel Cell  3  3  connexion
    ${password}  Read Excel Cell  3  4  connexion
    Close Current Excel Document
    
    Input Text  //html/body/div[3]/div/header/div[6]/div/section/div[1]/section[1]/form/div[1]/fieldset/div[1]/input[5]  ${pseudo}
    Input Text  //html/body/div[3]/div/header/div[6]/div/section/div[1]/section[1]/form/div[1]/fieldset/div[2]/input  ${password}

    Click Button    //*[@id="dropdownConnexion"]/div[3]/button
    Sleep    1
    Page Should Contain Element  //*[@id="dropdown-block"]/section/a[9]

    Close Browser