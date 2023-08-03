*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    RequestsLibrary
Library    XML
Resource    TestConnexionChampsManquants.robot
Resource    TestConnexionPassent.robot
Library    FakerLibrary    locale=fr_FR
Library    Dialogs


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
    Scroll to Element    //*[@id="nextStepBtn"]
    Click Button    //*[@id="nextStepBtn"]

Remplissage 2eme page
    #Données utilisateur   
    ${n_voie}    FakerLibrary.Address
    ${n_batiment}    FakerLibrary.Building Number
    #${batiment}    Set Variable    Bâtiment ${n_batiment}
    ${code_postal}    FakerLibrary.Postcode
    ${ville}    FakerLibrary.City
    ${pays}    Evaluate    random.randint(2, 3)    random

    #Remplissage des champs "Adresse utilisateur"
    Input Text    //*[@id="CompaniesAddress"]    ${n_voie}
    Input Text    //*[@id="CompaniesBP"]    ${n_batiment}
    Input Text    //*[@id="CompaniesPostCode"]    ${code_postal}
    Input Text    //*[@id="CompaniesCity"]    ${ville}
    Execute Manual Step    cliquer sur "Je ne suis pas un Robot"
    Click Button    //*[@id="submitAllForm"]
    ${adresse_verif}    Run Keyword And Return Status    Element Should Be Visible    //*[@id="createUserSubmitWithDQE"]
    IF    ${adresse_verif}    Click Button    //*[@id="createUserSubmitWithDQE"]
    Sleep    2

Vérification cas passant
    Page Should Contain Element  //*[@id="dropdown-block"]
    Sleep    5
    Close Browser

Scroll to Element
    [Arguments]    ${locator}
    ${horiz}    Get Horizontal Position    ${locator}
    ${vert}    Get Vertical Position    ${locator}
    Execute Javascript    window.scrollTo(${horiz}, ${vert})
    Sleep    2


