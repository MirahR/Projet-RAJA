*** Settings ***
Library  SeleniumLibrary
Library  ExcelLibrary
Library  XML

*** Variables ***
${excelFileName}  RajaJDD__300__0.xlsx

#*** Test Case ***
#CreationWrongFormat
#    SaveNewConnexionData  toto  tata  tutu@tutu.tutu  Titi1234
    


*** KeyWord ***
Test
    Log To Console    test
    
    Open Excel Document  ${excelFileName}  file
    ${pseudo}  Read Excel Cell  3  3  connexion
    ${password}  Read Excel Cell  3  4  connexion
    Close Current Excel Document

SaveNewConnexionData
  [Arguments]  ${name}  ${surname}  ${mail}  ${password}

  Open Excel Document  ${excelFileName}  excelfile
  ${line}       Set Variable  1
  ${condition}  Read Excel Cell  1  1  connexion

  WHILE  $condition != None
      ${line}       Evaluate    ${line} + 1
      ${condition}  Read Excel Cell  ${line}  1  connexion
  END
  
  Log To Console    ${line} ${name}

  Write Excel Cell  ${line}  1  ${name}      connexion
  Write Excel Cell  ${line}  2  ${surname}   connexion
  Write Excel Cell  ${line}  3  ${mail}      connexion
  Write Excel Cell  ${line}  4  ${password}  connexion
    
  Save Excel Document  ${excelFileName}
  Close Current Excel Document

GetLoginPassword

  Open Excel Document  ${excelFileName}  excelfile
  
  ${mail}      Read Excel Cell  3  3  connexion
  ${password}  Read Excel Cell  3  4  connexion
  Close Current Excel Document
  [return]  ${string}

GetArticleData
  [Arguments]  ${id}

  Open Excel Document  ${excelFileName}  excelfile

  ${bp}           Read Excel Cell  ${id}  7   produit
  ${marque}       Read Excel Cell  ${id}  8   produit
  ${matiere}      Read Excel Cell  ${id}  9   produit
  ${long}         Read Excel Cell  ${id}  10  produit
  ${larg}         Read Excel Cell  ${id}  11  produit
  ${dam}          Read Excel Cell  ${id}  12  produit
  ${color}        Read Excel Cell  ${id}  13  produit
  ${newProduct}   Read Excel Cell  ${id}  14  produit
  ${poid}         Read Excel Cell  ${id}  15  produit
  ${typeFerm}     Read Excel Cell  ${id}  16  produit
  ${epaisseur}    Read Excel Cell  ${id}  17  produit
  ${alimentaire}  Read Excel Cell  ${id}  18  produit
  ${cannelure}    Read Excel Cell  ${id}  19  produit

  Close Current Excel Document

  [return]  ${bp}  ${marque}  ${matiere}  ${long}  ${larg}  ${dam}  ${color}  ${newProduct}  ${poid}  ${typeFerm}  ${epaisseur}  ${alimentaire}  ${cannelure}

GetArticleCategorie
  [Arguments]  ${id}

  Open Excel Document  ${excelFileName}  excelfile

  ${cat1}  Read Excel Cell  ${id}  4   produit
  ${cat2}  Read Excel Cell  ${id}  5   produit
  ${cat3}  Read Excel Cell  ${id}  6   produit
  
  Close Current Excel Document

  [return]  ${cat1}  ${cat2}  ${cat3}