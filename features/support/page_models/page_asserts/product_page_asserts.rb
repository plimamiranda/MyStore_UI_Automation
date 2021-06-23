module PageModels

    class ProductPageAsserts 

        include RSpec::Matchers
        include Capybara::DSL
        
        def check_successfull_message_added_to_cart
            #Capybara.default_max_wait_time = 10
            expect(page).to have_selector 'i.icon-ok'
            expect(page).to have_text 'Product successfully added to your shopping cart'
        end
    end
    
end