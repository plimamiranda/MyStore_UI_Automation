module PageModels
    class AccountCreationPage < SitePrism::Page
        
        include RSpec::Matchers
        include Capybara::DSL
        
        set_url '/index.php?controller=authentication&back=my-account#account-creation'
        
        #Personal Information
        element :title_gender, '#uniform-id_gender1'
        element :first_name, '#customer_firstname'
        element :last_name, '#customer_lastname'
        element :email, '#email'
        element :password, '#passwd'
        element :birthday_day, '#uniform-days'
        element :birthday_month, '#uniform-months'
        element :birthday_year, '#uniform-years'

        #Address information
        element :address, '#address1'
        element :city, '#city'
        element :state, '#uniform-id_state'
        element :postcode, '#postcode'
        element :phone_mobile, '#phone_mobile'
        element :aliaas, '#alias'

        element :register_button, '#submitAccount'
        element :account_creation_form, '#account-creation_form'
        
        def fill_full_name
            Capybara.default_max_wait_time = 7
            scroll_to(find('#account-creation_form'), :down)
            fill_first_name
            fill_last_name
        end

        def fill_first_name
            first_name.set(Faker::Name.first_name)
        end
        
        def fill_last_name
            last_name.set(Faker::Name.last_name)
        end
        
        def fill_password
            password.set('password')
        end

        def choose_title
            title_gender.click
        end
        
        def select_birth_date
            birthday_day.select('day')
            birthday_month.select('month')
            birthday_year.select('year')
        end
       
        def fill_address
            scroll_to(find('div.account_creation:nth-child(2) > h3:nth-child(1)'), :down)
            address.set(Faker::Address.full_address)
            city.set(Faker::Address.city)
            state.select 'Arizona'
            postcode.set('00000')
            phone_mobile.set(Faker::PhoneNumber.cell_phone)
            aliaas.set('12345')
        end
        
        def check_required_fields
           #Pending
        end
        
        def click_on_register_btn
            register_button.click
        end
        
        def check_url_path
            #wait_for_element.until { page.current_url.native }
            expect(page).to have_current_path('http://automationpractice.com/index.php?controller=my-account')  
        end
        
        def check_for_welcome_message
            expect(page).to have_content('Welcome to your account. Here you can manage all of your personal information and orders.')
        end
    end
end