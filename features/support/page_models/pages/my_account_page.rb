module PageModels
    
    class MyAccountPage
        
        include RSpec::Matchers
        include Capybara::DSL
        
        def move_cursor_over_link_on_menu_container
            within(find('ul.sf-menu.clearfix.menu-content')) do 
                find_all('li')[0].hover 
            end
        end
        
        def click_link_on_submenu_container
            within(find('ul.submenu-container.clearfix.first-in-line-xs')) do 
                find_link('Summer Dresses').click 
            end
        end

    end
end