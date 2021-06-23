Given("I am signed in") do
    home_page.go_to_home_page
    home_page.go_to_authentication_page
    authentication_page.perform_login(email,password)   
end

Given(/^I have found a (.*?) on the search results that I want to buy$/) do |product|
    home_page.go_to_home_page 
    home_page.search_for_product(product)
    search_page.select_product_from_list
end

Given("I have found a product that I want to buy") do
    home_page.select_product_from_submenu_container
end

Given("I add this product to my Cart") do
    product_page.click_to_add_to_cart
    product_page_asserts.check_successfull_message_added_to_cart
end

Given("I add this product to my Cart from the category page") do
    category_page.click_on_add_to_cart
   # category_page_asserts.check_successfull_message_added_to_cart
end

Given("I choose a product that I want to buy") do
    # Move cursor over Women's link.
    my_account_page.move_cursor_over_link_on_menu_container
    # Click on sub menu 'Summer Dresses'.
    my_account_page.click_link_on_submenu_container
    # Mouse hover on the second product displayed.
    category_page.mouse_over_product_list_displayed
    # 'More' button will be displayed, click on 'More' button.
    category_page.click_on_more_button
end

Given("I select the size, color and quantity") do
    product_page.select_size
    product_page.select_color
    product_page.select_quantity
end

Given("I go to my order page") do
    product_page.click_on_proceed_to_checkout_to_go_to_order_page
end

Given("I complete my order process until payment") do
    order_page.click_to_agree_to_the_terms_of_service
    order_page.click_on_proceed_to_checkout_shipping_step
    order_page.click_to_pay
    order_page.click_to_confirm_order
end

#needs review
When("I click to proceed to checkout") do
    order_page.click_on_proceed_to_checkout_summary_step
    #Check if user is signed or not
    if order_page.is_user_on_step_2_sign_in? == true
        #go_to_step "I need to create an account or sign in to continue"
        authentication_page.check_sign_in_step
    else
        if order_page.is_user_on_step_3_address? == true
            order_page.click_on_proceed_to_checkout_address_step
        end
    end
end

Then("I need to create an account or sign in to continue") do
    authentication_page.check_sign_in_step
end

Then("My buying process is completed") do
    order_page.confirm_order_completed
end

Then("The product is succesfully added to my cart") do
    product_page_asserts.check_successfull_message_added_to_cart
end