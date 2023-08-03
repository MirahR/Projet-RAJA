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