# Common Steps
Given("I am on the Authentication page") do
    home_page.go_to_authentication_page
end

# Login steps 
When("I enter valid sign in credentials") do
    authentication_page.sign_in_with_valid_email
    authentication_page.sign_in_with_valid_password
 end
 
 When("I click on sign in button") do
     authentication_page.click_on_sign_in_btn
 end
 
 Then("I am successfully signed in") do
     authentication_page.confirm_user_signed_in
 end

# Create an account steps
Given("I am a guest user") do
    home_page.go_to_home_page
end

Given("I am not signed in") do
    home_page.go_to_home_page
end

When("I enter a valid email address to create an account") do
    authentication_page.enter_valid_email_to_create_account
    authentication_page.check_valid_email_to_create_account
end

When("I click on Create an account") do
    authentication_page.click_on_create_account_btn
end

When("I fill valid personal information") do
    Capybara.default_max_wait_time = 7
    account_creation_page.choose_title
    account_creation_page.fill_full_name
    account_creation_page.fill_password
    account_creation_page.select_birth_date
    account_creation_page.fill_address
    #save_and_open_page
end

When("All required fields are filled up") do
    #save_screenshot
    account_creation_page.check_required_fields
end

When("I click on Register") do
    account_creation_page.click_on_register_btn
    #print page.html
end

Then("Registration success page is displayed") do
    account_creation_page.check_url_path
end

Then("welcome message is shown") do
    account_creation_page.check_for_welcome_message
   # page.save_screenshot
end

