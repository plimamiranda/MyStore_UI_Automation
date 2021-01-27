Feature: Sign into MyStore
              As a registered user of MyStore
              I want to sign in
              So that I can access my account and buy products

        Background: Navigate to sign in
            Given I am not signed in
              And I am on the Authentication page

        @sign_in
        Scenario: Successfull sign in
             When I enter valid sign in credentials
              And I click on sign in button
             Then I am successfully signed in

        
            #  Login 
            #   Input Correct username and password – Login Success
            #   Input incorrect username and correct password – Login Failure
            #   Input correct username and incorrect password - Login Failure