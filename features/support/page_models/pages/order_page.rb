module PageModels
    
    class OrderPage < SitePrism::Page
        
        include RSpec::Matchers
        include Capybara::DSL
        
        set_url 'index.php?controller=order'
        
        element :proceed_to_checkout_summary_step, '.standard-checkout'
        element :proceed_to_checkout_addres_step, 'button.button:nth-child(4)'
        element :proceed_to_checkout_shipping_step, 'button.button:nth-child(4)'
        element :agree_to_the_terms_of_service, '#uniform-cgv'
        element :confirm_order_button, 'button.button-medium'
        element :pay_by_bank_wire, '.bankwire'
        element :pay_by_check, '.cheque'
        
        
        def click_on_proceed_to_checkout
            Capybara.default_max_wait_time = 7
            scroll_to(find('p.cart_navigation.clearfix'), :down)
            find('button.button:nth-child(4)').click
        end
        
        def click_on_proceed_to_checkout_summary_step
            scroll_to(find('p.cart_navigation.clearfix'), :down)
            find('.standard-checkout').click
            #proceed_to_checkout_summary_step.click
        end
        
        def click_on_proceed_to_checkout_address_step
            find('button.button:nth-child(4)').click
            #proceed_to_checkout_addres_step.click
        end
        
        def click_on_proceed_to_checkout_shipping_step
            find('button.button:nth-child(4)').click
            #proceed_to_checkout_shipping_step.click
        end
        
        def click_to_agree_to_the_terms_of_service
            within(find('.checkbox')) do
            agree_to_the_terms_of_service.click
            end
        end

        def click_to_pay
            pay_by_bank_wire.click
        end
        
        def click_to_confirm_order
            confirm_order_button.click
        end
        
        def confirm_order_completed
            within(find('.cheque-indent')) do 
            expect(page).to have_content 'Your order on My Store is complete.' 
            end
        end

        def is_user_on_step_2_sign_in?
            @response = page.has_css?('ul li.step_current.second')
            return @response
        end

        def is_user_on_step_3_address?
            @response = page.has_css?('ul li.step_current.third')
            return @response
        end

    end
end

