Feature: Customer adding product to Cart
              As a customer
              I should be able to add a product to my Cart
              So that I can buy it later

        @adding @regression @smoke
        Scenario Outline: First time user adding product to cart
            Given I have found a <product> on the search results that I want to buy
              And I add this product to my Cart
              And I go to my order page
             When I click to proceed to checkout
             Then I need to create an account or sign in to continue
        Examples:
                  | product |
                  | dress   |
        
        @adding @regression @smoke
        Scenario: Existing user adding a product to cart
            Given I am signed in
              And I have found a product that I want to buy
              And I add this product to my Cart from the category page
             Then The product is succesfully added to my cart

        

        