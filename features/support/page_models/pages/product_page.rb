module PageModels

    class ProductPage < SitePrism::Page

        include RSpec::Matchers
        include Capybara::DSL

        set_url 'index.php?id_product'

        element :add_to_cart_button, 'button.exclusive'
        #element :cart_box, '.box-cart-bottom'
        element :proceed_to_checkout_button, 'a.btn:nth-child(2) > span:nth-child(1)'

        #product attributes
        element :size, '#uniform-group_1'
        element :quantity_wanted, '#quantity_wanted'

        def click_to_add_to_cart           
            #Capybara.default_max_wait_time = 10
            #Selenium::WebDriver::Wait.new(:timeout => 10).until { cart_box.native }
            cart_box = find('.box-cart-bottom', wait: 20)
            scroll_to(cart_box, :top)
            add_to_cart_button.click 
        end

        def select_size
            size.select('M')
        end

        def select_color
            within(find('#color_to_pick_list'))do 
            find('#color_16').click 
            end
        end

        def select_quantity
            quantity_wanted.set('3')
            find('.btn.btn-default.button-plus').click
            find('.btn.btn-default.button-minus').click
        end

        def click_on_proceed_to_checkout_to_go_to_order_page
            proceed_to_checkout_button.click
        end

    end

end