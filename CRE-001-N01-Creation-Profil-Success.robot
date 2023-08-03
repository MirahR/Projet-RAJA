*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    RequestsLibrary
Library    XML
Resource    TestConnexionChampsManquants.robot
Resource    TestConnexionPassent.robot
Library    FakerLibrary    locale=fr_FR

*** Variables ***
${mail1}    FakerLibrary.Words

*** Test Cases ***
Page création d'un compte
    OpenRaja
    Remplissage 1ere page
    Remplissage 2eme page


*** Keywords ***
Remplissage 1ere page
    # Ouvrir page "créer un compte"
    Click Button    //*[@id="dropdown-account"]/button
    Click Button    //*[@id="redirectCreateAccount"]

    #Données utilisateur
    #${statut}    Evaluate    random.randint(1, 2)    random
    ${mail}    FakerLibrary.Ascii Email
    ${mdp}    FakerLibrary.Password
    ${civility}    Evaluate    random.randint(2, 3)    random
    ${prenom}    FakerLibrary.First Name
    ${nom}    FakerLibrary.Last Name
    ${tel}    FakerLibrary.Phone Number


    #Remplissage des champs "Information utilisateur"
    Click Element    //*[@id="userInfoForm"]/div/fieldset/div[2]/label/span
    Input Text    //*[@id="IdentifiersLogin"]    ${mail}
    Input Text    //*[@id="NewPwdPassword"]    ${mdp}
    Click Element    //*[@id="civilitie"]
    Click Element    //*[@id="civilitie"]/option[${civility}]
    Input Text    //*[@id="InfoFirstname"]    ${prenom}
    Input Text    //*[@id="InfoLastname"]    ${nom}
    Input Text    //*[@id="directPhone"]    ${tel}
    Click Button    //*[@id="nextStepBtn"]

Remplissage 2eme page
    #Données utilisateur   
    ${n_voie}    FakerLibrary.Address
    ${n_batiment}    FakerLibrary.Building Number
    #${batiment}    Set Variable    Bâtiment ${n_batiment}
    ${code_postal}    FakerLibrary.Postalcode
    ${ville}    FakerLibrary.City
    ${pays}    Evaluate    random.randint(2, 3)    random

    #Remplissage des champs "Adresse utilisateur"
    Input Text    //*[@id="CompaniesPostCodeSearch"]    ${n_voie}
    Input Text    //*[@id="CompaniesBP"]    ${n_batiment}




