#Authentication page - register and sign-in features

module PageModels

    class AuthenticationPage < SitePrism::Page

        include RSpec::Matchers
        include Capybara::DSL

        set_url '/index.php?controller=authentication&back=my-account'

        #Login information / Already Registered
        element :email, '#email'
        element :password, '#passwd'
        element :lost_password, '.lost_password.form-group'
        element :sign_in_button, '#SubmitLogin'
        element :login, '.login'
        
        #Create an account
        element :email_create, '#email_create'
        element :create_account_button, '#SubmitCreate'
        element :valid_email_form, 'div.form-group.form-ok'
        element :invalid_email_form, 'div.form-group.form-error'
        
        def perform_login
            sign_in_with_valid_email
            sign_in_with_valid_password
            click_on_sign_in_btn
        end

        def sign_in_with_valid_email
            email.set('validEmail').send_keys [:tab]
        end

        def enter_valid_email_to_create_account
            email_create.set(Faker::Internet.email).send_keys [:tab]
        end

        def check_valid_email_to_create_account
             expect(page).to have_selector 'div.form-group.form-ok'
        end

        def sign_in_with_valid_password
            password.set('validpassword').send_keys [:tab]
        end

        def click_on_create_account_btn
            create_account_button.click
        end

        def click_on_sign_in_btn
            sign_in_button.click
        end

        def confirm_user_signed_in
        end

        def check_sign_in_step
            expect(page).to have_selector('#create-account_form')
            expect(page).to have_selector('#login_form')
        end

    end
end