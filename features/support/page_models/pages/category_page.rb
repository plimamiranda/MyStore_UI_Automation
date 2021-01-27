module PageModels
    
    class CategoryPage < SitePrism::Page
        
        include RSpec::Matchers
        include Capybara::DSL

        set_url 'index.php?id_category'
        
        #Elements
        element :add_to_cart, 'li.ajax_block_product:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(4) > a:nth-child(1)'

        def mouse_over_product_list_displayed
            within(find('ul.product_list')) do 
                find_all('li.ajax_block_product')[1].hover 
            end
        end
        
        def click_on_more_button
            find('a.button.lnk_view.btn.btn-default').click
        end
        
        def click_on_add_to_cart
            add_to_cart.click    
        end

    end
    
end