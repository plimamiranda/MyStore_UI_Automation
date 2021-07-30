#Authentication page - register and sign-in features

module PageModels

    class AuthenticationPage < SitePrism::Page

        include RSpec::Matchers
        include Capybara::DSL
        include KnowsAboutConfig

        set_url '/index.php?controller=authentication&back=my-account'

        #Login information / Already Registered
        element :email_address, '#email'
        element :password_login, '#passwd'
        element :lost_password, '.lost_password.form-group'
        element :sign_in_button, '#SubmitLogin'
        element :login, '.login'
        
        #Create an account
        element :email_create, '#email_create'
        element :create_account_button, '#SubmitCreate'
        element :valid_email_form, 'div.form-group.form-ok'
        element :invalid_email_form, 'div.form-group.form-error'
        element :invalid_email_address, 'div.alert.alert-danger'
        
        def perform_login(email,password)
            sign_in_with_valid_email(email)
            sign_in_with_valid_password(password)
            click_on_sign_in_btn
        end

        def sign_in_with_valid_email(email)
            email_address.set(email).send_keys [:tab]
        end

        def try_sign_in_with_invalid_email(invalid_email)
            email_address.set(invalid_email).send_keys [:tab]
        end

        def check_invalid_email_warning_message(warning_message)
            expect(page).to have_selector 'div.alert.alert-danger'
        end

        def enter_valid_email_to_create_account
            email_create.set(Faker::Internet.email).send_keys [:tab]
        end

        def check_valid_email_to_create_account
             expect(page).to have_selector 'div.form-group.form-ok'
        end

        def sign_in_with_valid_password(password)
            password_login.set(password).send_keys [:tab]
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
            expect(page).to have_selector('#create-account_form.box')
            expect(page).to have_selector('#login_form.box')
        end

    end
end