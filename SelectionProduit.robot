*** Settings ***
Library   SeleniumLibrary
Library   ExcelLibrary
Library   XML
Resource  TestConnexionPassent.robot
Resource  ExcelTool.robot
Resource  CRE-001-N01-Creation-Profil-Success.robot
Test Setup  OpenRaja

*** Variables ***
${name}  Ruban vinyle de marquage blanc 3M 50 mm x 33 m

*** Test Case ***
SelectProduct
    SelectAllAditionalCategorie  2
    Close All Browsers
    


*** KeyWord ***
SelectAllAditionalCategorie
  [Arguments]  ${id}

    Click Element      //*[@id="algolia-loader"]
    Sleep    0.5
    Input Text         //html/body/div[5]/div[1]/section/div/div[1]/input  ${name}
    Sleep    .5

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

