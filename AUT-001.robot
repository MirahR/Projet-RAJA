*** Settings ***
Library  SeleniumLibrary
Library  ExcelLibrary
Library  XML
Library  FakerLibrary  locale=fr_FR
Resource  CRE-001-N01-Creation-Profil-Success.robot
Resource  CRE-001-E01-creationProfil-erreursChampsObligatoires.robot
Test Setup  OpenRaja

*** Variables ***
${nom}
${prenom}
${mail}
${mdp}

*** Test Case ***
CreationWrongFormat
    CasPassent
    
CasNonPassentChampOblicgatoire
    testProfilChampsObligatoiresPage1
    Sleep    5
    testProfilChampsObligatoiresPage2

*** KeyWord ***
CasPassent
    ${nom}  ${prenom}  ${mail}  ${mdp}  Remplissage 1ere page
    Remplissage 2eme page
    Vérification cas passant  ${nom}  ${prenom}  ${mail}  ${mdp}
