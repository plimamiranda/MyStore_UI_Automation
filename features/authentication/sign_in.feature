Feature: Sign into MyStore
              As a registered user of MyStore
              I want to sign in
              So that I can access my account and buy products

        Background: Navigate to sign in
            Given I am not signed in
              And I am on the Authentication page

        @sign_in
        Scenario: Successful sign in
             When I enter valid sign in credentials
              And I click on sign in button
             Then I am successfully signed in

        @sign_in_negative
        Scenario Outline: Unsuccessful sign in with invalid email address
            Given I enter an <invalid_email>
             When I click on sign in button
             Then the following <warning_message> is displayed
              And login is not completed
        Examples:
                  | invalid_email                  | warning_message                         |
                  | no_dot@missingdot              | There is 1 error Invalid email address. |
                  | only_account_name              | There is 1 error Invalid email address. |
                  | no_email_server_address@       | There is 1 error Invalid email address. |
                  | no_domain@mail.                | There is 1 error Invalid email address. |
                  | @no_account_name.com           | There is 1 error Invalid email address. |
                  | @no_account_name_no_dot        | There is 1 error Invalid email address. |
                  | £$%#@special.chars             | There is 1 error Invalid email address. |
                  | special_chars@_£$%#_domain.com | There is 1 error Invalid email address. |

        @sign_in_negative
        Scenario Outline: Unsuccessful sign in with empty email field
            Given I enter no email address
             When I click on sign in button
             Then the following <warning_message> is displayed
        Examples:
                  | warning_message            |
                  | An email address required. |

        @sign_in_negative_password
        Scenario Outline: Unsuccessful sign in with invalid password
            Given I enter a <valid_email>
              And I enter an <invalid_password>
             When I click on sign in button
             Then the following <warning_message> is displayed
        Examples:
                  | valid_email        | invalid_password | warning_message                    |
                  | autotest@email.com | @341222          | There is 1 error Invalid password. |
                  | autotest@email.com | 111133#          | There is 1 error Invalid password. |
                  