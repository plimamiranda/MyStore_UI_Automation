
Feature: Customer buying Products from My Store
              As a registered user of MyStore
              I want to be able to sign in
              And buy products
    
        Background:
            Given I am signed in
    
        @buy
        Scenario: Registered user buying products - Happy Path
            Given I choose a product that I want to buy
              And I select the size, color and quantity
              And I add this product to my Cart
             When I go to my order page
              And I click to proceed to checkout
              And I complete my order process until payment
             Then My buying process is completed
 