*** Settings ***
Library   SeleniumLibrary
Library   ExcelLibrary
Library    FakerLibrary    locale=fr_FR
Library   XML
Resource  TestConnexionPassent.robot
Resource  ExcelTool.robot
Resource  CRE-001-N01-Creation-Profil-Success.robot
Resource    SelectionProduit.robot

*** KeyWord ***
GetFullName
    Open Excel Document  ${excelFileName}  excelfile
    ${last_name}    Read Excel Cell    3    1    connexion
    ${first_name}    Read Excel Cell    3    2    connexion
    Close Current Excel Document
    [return]    ${last_name} ${first_name}


Validation panier
    # Ouvrir le panier
    Click Element    //*[@id="basket-dropper"]
    Sleep    .2
    Click Button    //*[@id="quickcart-container"]/div[1]/button
    Sleep    .2
    
    # Valider le panier
    Click Button    //*[@id="nextBtnStep1"]
    Sleep    .2

    # Choisir la livraison
    ${livraison}    Evaluate    random.randint(2, 4)    random
    Click Element    //*[@id="formShipping"]/div/div[1]/section/fieldset/div[${livraison}]/label/div/div/h3
    Sleep    .2

    # Valider la livraison
    Click Button    //*[@id="next-step-btn"]
    Sleep    .2

    # Valider et payer
    Click Button    //*[@id="cgv"]
    Sleep    .2
    Click Button    //*[@id="next-step-btn"]
    Sleep    .2

    # Paiement
    # Données de paiement
    ${num_card}    FakerLibrary.Credit Card Number
    ${full_name}    GetFullName
    ${date_exp_month}    Evaluate    random.randint(1, 12)    random
    ${date_exp_year}    Evaluate    random.randint(1, 40)    random
    ${code_verif}    FakerLibrary.Credit Card Security Code
    ${date_exp}    FakerLibrary.Credit Card Expire

    # Insertion des données de paiement
    Input Text    //*[@id="payment-cardnumber"]    ${num_card}
    Input Text    //*[@id="payment-cardholdername"]    ${full_name}
    Scroll to Element    //*[@id="payment-submit"]
    Click Element    //*[@id="payment-cardexpirationmonth"]
    Click Element    //*[@id="payment-cardexpirationmonth"]/option[${date_exp_month}]
    Click Element    //*[@id="payment-cardexpirationyear"]
    Click Element    //*[@id="payment-cardexpirationyear"]/option[${date_exp_year}]
    Input Text    //*[@id="payment-cvc"]    ${code_verif}

    # Valider le paiement
    Click Button    //*[@id="payment-submit"]
    
  
