*** Settings ***
Library   SeleniumLibrary
Library   ExcelLibrary
Library   XML
Resource  TestConnexionPassent.robot
Resource  ExcelTool.robot
Resource  CRE-001-N01-Creation-Profil-Success.robot
Resource  REC-001-N01-Filtre-categories.robot
Resource  REC-001-N01_SelectionProduit_verifArticleQuantitéValidation.robot
Test Setup  OpenRaja

*** Variables ***
${name}  Pastille

*** Test Case ***
SelectProduct

    Click Element      //*[@id="algolia-loader"]
    Sleep    0.5
    Input Text         //html/body/div[5]/div[1]/section/div/div[1]/input  ${name}
    Sleep    .5
    Filtre categorie    3
    SelectAllAditionalCategorie  3
    VerificationProduit  3
    Sleep    10
    Close All Browsers
    








*** KeyWord ***
SelectAllAditionalCategorie
  [Arguments]  ${id}

    #scroll button tous les filtres
    Scroll to Element  //*[@id="filters-layer-content"]/button
    Click Element      //*[@id="filters-layer-content"]/button

    @{categorieDatas}=   GetArticleData  ${id}

    FOR  ${element}  IN  @{categorieDatas}
        Log    ${element}
        IF  $element != None
            Scroll to Element  //*[text()= '${element}']
            Click Element  //*[text()= '${element}']
        END
    END

