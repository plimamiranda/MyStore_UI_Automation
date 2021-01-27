module PageModels

    class HomePage < SitePrism::Page

        include RSpec::Matchers
        include Capybara::DSL

        set_url '/index.php'

        #Header user information
        element :sign_in_button, 'a.login'
        element :search_box_top, '#search_query_top'

        
        def go_to_home_page
            visit '/'
        end

        def go_to_authentication_page
            sign_in_button.click
        end

        def search_for_product(product)
            search_box_top.set(product).send_keys [:enter]
        end
        
        def select_product_from_submenu_container
            find_all(".sf-with-ul")[0].hover
            find(".sf-menu > li:nth-child(1) > ul:nth-child(2) > li:nth-child(1) > a:nth-child(1)").click
            find_all(".product-container")[0].click
            Capybara.default_max_wait_time = 10
        end

    end

    
end