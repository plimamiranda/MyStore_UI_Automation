Feature: Register a new My Store user
              As a guest user
              I want to make an account
              So that I can purchase products

        Background:
            Given I am a guest user

        @register
        Scenario: Succesful new user Registration
            Given I am on the Authentication page
             When I enter a valid email address to create an account
              And I click on Create an account
              And I fill valid personal information
              And All required fields are filled up
             When I click on Register
             Then Registration success page is displayed
              And welcome message is shown