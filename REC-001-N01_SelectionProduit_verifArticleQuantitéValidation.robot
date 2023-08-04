*** Settings ***
Library   OperatingSystem
Library   Collections
Library   SeleniumLibrary
Library   XML
Resource  ExcelTool.robot
Resource  TestConnexionPassent.robot
Resource  CRE-001-N01-Creation-Profil-Success.robot
Library    FakerLibrary    locale=fr_FR
#Test Setup    OpenRaja



** Variables ***
${refProduitValide}  471BLA
${nomProduitValide}    Ruban vinyle de marquage blanc 3M 50 mm x 33 m
${prixValide}     58,30

#${refProduitValide}  NEU3
#${nomProduitValide}    Sachet plastique transparent à fond carton 10 x 22 cm
#${prixValide}     16,15

@{Ruban}    471BLA    Ruban vinyle de marquage blanc 3M 50 mm x 33 m    58,30

*** KeyWord ***
Test
    Click Element      //*[@id="algolia-loader"]
    Sleep    1
    Input Text         //html/body/div[5]/div[1]/section/div/div[1]/input  ${refProduitValide}
    Sleep    0.4

    
    #Click Element     //*[@id="searchAlgolia"]/div[1]/div[1]/div[3]/div[2]/div[1]/article/a[2]/span[2]
   # Click Element    //*[@id="customize-thumbnails"]/div[2]
    
VerificationProduit
    [Arguments]  ${id}

    ${data}=  GetArticleNameAndPrice    ${id}
    ${nomProduitValide}=  Set Variable  ${data}[0]
    ${prixValide} =  Set Variable  ${data}[1]

    Sleep    1
    Click Element    //*[@id="searchAlgolia"]/div[1]/div[1]/div[3]/div[3]/div/article/a[2]/img

    #RETURN
    #${nomProduit}    Get Text    //*[@id="searchAlgolia"]/div[1]/div[1]/div[3]/div[2]/div/article/a[2]
    #Log    ${nomProduit}
    #Should Contain     ${nomProduit}    ${nomProduitValide} 
    #${prix}    Get Text    //*[@id="searchAlgolia"]/div[1]/div[1]/div[3]/div[2]/div/article/a[4]/span/span[1]/span[2]/span
    #Log    ${prix}
    #Should Contain     ${prix}   ${prixValide} 


    #Click Element    //*[@id="searchAlgolia"]/div[1]/div[1]/div[3]/div[2]/div/article/a[2]/img
    Click Element    //*[@id="articleQuantity"]
    Press Keys  None  CTRL-A
    Sleep    1
    Input Text  None  6

   Sleep    10
    
    Click Element    //*[@id="addToCart"]


    #${messageConfirmation}       Get Text    /html/body/div[11]/div[1]/h2
    #Log    ${messageConfirmation}

 

        
    
    

  
    
