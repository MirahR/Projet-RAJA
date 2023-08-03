*** Settings ***
Library  SeleniumLibrary
Library  ExcelLibrary
Library  XML

*** Variables ***
${excelFileName}  RajaJDD__300__0.xlsx

*** Test Case ***
CreationWrongFormat
    SaveNewConnexionData  toto  tata  tutu  titi
    #write new user to excel file
    


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

write new user to excel file
    ${row}=    Set Variable    1
    ${row}    Convert To Integer    ${row}
    Open Excel Document    ${excelFileName}    1
    ${cell_login}    Set Variable    NULL
    WHILE    "${cell_login}" != "None"
        ${cell_login}    Read Excel Cell    ${row}    1
        ${row}    Evaluate    ${row}+1
    END
    ${row}    Evaluate    ${row}-1
    Write Excel Cell    ${row}    1    toto
    Write Excel Cell    ${row}    2    tutu
    Write Excel Cell    ${row}    3    tata
    Write Excel Cell    ${row}    4    titi
    Save Excel Document    ${excelFileName}
    Close All Excel Documents


GetLoginPassword

  Open Excel Document  ${excelFileName}  excelfile
  
  ${mail}      Read Excel Cell  1  3  connexion
  ${password}  Read Excel Cell  1  4  connexion
  Close Current Excel Document
  [return]  ${string}