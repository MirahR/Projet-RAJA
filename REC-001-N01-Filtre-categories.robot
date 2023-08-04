*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    RequestsLibrary
Library    XML
Resource    TestConnexionChampsManquants.robot
Resource    TestConnexionPassent.robot
Resource    CRE-001-N01-Creation-Profil-Success.robot
Resource    ExcelTool.robot
Library    FakerLibrary    locale=fr_FR
Library    ExcelLibrary


*** Keywords ***
Filtre categorie
    # Sélection de la div contenant les catégories
    Click Button    //*[@id="filters-layer-content"]/div[2]/section[1]/div/button
    [Arguments]    ${id}
        @{liste_produit}    ExcelTool.GetArticleCategorie    ${id}
        ${cat1}    Set Variable    ${liste_produit}[0]
        ${cat2}    Set Variable    ${liste_produit}[1]
        ${cat3}    Set Variable    ${liste_produit}[2]
        Run Keyword If  $cat1 != None    Click Element     //*[contains(text(),'${cat1}')]
        Sleep    .1
        #Scroll to Element    //*[@id="filters-layer-content"]/div[2]/section[1]/div/button
        #Click Button    //*[@id="filters-layer-content"]/div[2]/section[1]/div/button
        Run Keyword If  $cat2 != None    Click Element     //*[contains(text(),'${cat2}')]
        Sleep    .1
        Run Keyword If  $cat3 != None    Click Element     //*[contains(text(),'${cat3}')]
