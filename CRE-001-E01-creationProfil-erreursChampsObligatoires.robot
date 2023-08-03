*** Settings ***
Library    OperatingSystem
Library    Collections
Library    SeleniumLibrary
Library    XML

Resource    TestConnexionPassent.robot
Resource    CRE-001-N01-Creation-Profil-Success.robot
Library     FakerLibrary    locale=fr_FR
Test Setup    OpenRaja
*** Variables ***
*** Test Cases ***

test de creation de profil avec des champs obligatoires vides
   Click Button    xpath=//*[@id="dropdown-account"]/button
   Click Button    xpath=//*[@id="redirectCreateAccount"]
   
   ${email} =  FakerLibrary.email
   ${password}    FakerLibrary.Password    length=${9}    special_chars=bool=${False}
   #civilite est égale à 1 pour femme et 2 pour homme 
   ${civilite}    SET VARIABLE     1    
   ${telephone} =  FakerLibrary.phone_number   
   ${nom}    FakerLibrary.Last Name Nonbinary
   ${prenom}    FakerLibrary.First Name Nonbinary

   Scroll to Element    //*[@id="nextStepBtn"]
   Sleep     1
   Click Button  xpath://*[@id="nextStepBtn"]
  

    ${messageErreurStatut}   Get Text   //*[@id="userInfoForm"]/div/fieldset/div[1]/span
    Log     ${messageErreurStatut}   
    Should Contain    ${messageErreurStatut}    Ce champ est obligatoire


     ${messageErreurEmail}   Get Text   //*[@id="userInfoForm"]/div/div[2]/div/label[2]
    Log     ${messageErreurEmail}   
    Should Contain    ${messageErreurEmail}    Champ obligatoire
   
    Capture Page Screenshot

     ${messageErreurPassmord}   Get Text   //*[@id="ServiceSelect"]/span
    Log     ${messageErreurPassmord}   
    Should Contain    ${messageErreurPassmord}    Information obligatoire



    ${messageErreurCivilite}   Get Text      //*[@id="ServiceSelect"]/span 
    Should Contain    ${messageErreurCivilite}    Information obligatoire


    ${messageErreurNom}   Get Text       //*[@id="userInfoForm"]/div/div[6]/div[2]/label[2]
    Should Contain    ${messageErreurNom}    Champ obligatoire



    ${messageErreurPrenom}   Get Text       //*[@id="userInfoForm"]/div/div[6]/div[1]/label[2]
    Log     ${messageErreurPrenom}   
    Should Contain    ${messageErreurPrenom}    Champ obligatoire


    ${messageErreurTelephone}   Get Text       //*[@id="userInfoForm"]/div/div[8]/div/label[2]
    Log     ${messageErreurTelephone}   
    Should Contain    ${messageErreurTelephone}    Information obligatoire

    Remplissage 1ere page

    
    
    Scroll to Element    //*[@id="submitAllForm"]
    
    Click Button      xpath://*[@id="submitAllForm"]
    

   ${messageErreurVoie}   Get Text       //*[@id="userInfoCompletedForm"]/div/div[12]/div/label[2]
    Log     ${messageErreurVoie}   
    Run Keyword And Ignore Error     Should Contain    ${messageErreurVoie}    La voie est obligatoire

   ${messageErreurcodepostal}    Get Text    //*[@id="userInfoCompletedForm"]/div/div[15]/div[1]/label[2]     
   Log     ${messageErreurcodepostal}
   Should Contain     ${messageErreurcodepostal}    Code postal obligatoire


    ${messageErreurVille}    Get Text     //*[@id="userInfoCompletedForm"]/div/div[15]/div[2]/label[2]   
    Log     ${messageErreurVille}  
    Should Contain    ${messageErreurVille}     La ville est obligatoire. Veuillez entrer une ville.
    
   
   



   
   
  
      
      
   

*** Keywords ***