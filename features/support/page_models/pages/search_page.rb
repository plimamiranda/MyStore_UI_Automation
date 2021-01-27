module PageModels
    
    class SearchPage < SitePrism::Page

        include RSpec::Matchers
        include Capybara::DSL

        def select_product_from_list
            within(find('ul.product_list.grid.row')) do 
                find_all('li h5 a')[0].click
            end
        end
        
        def click_on_add_to_cart
        end


    end
    
end