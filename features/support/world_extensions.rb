module KnowsMyWorld

    def authentication_page
        @authentication_page || PageModels::AuthenticationPage.new
    end

    def home_page
        @home_page || PageModels::HomePage.new
    end

    def product_page
        @product_page || PageModels::ProductPage.new
    end
     
    def product_page_asserts
        @product_page_asserts || PageModels::ProductPageAsserts.new
    end

    def search_page
        @search_page || PageModels::SearchPage.new
    end

    def my_account_page
        @my_account_page || PageModels::MyAccountPage.new
    end

    def account_creation_page
        @account_creation_page || PageModels::AccountCreationPage.new
    end

    def category_page
        @category_page || PageModels::CategoryPage.new
    end

    def wait_for_element
        @wait_for_element || Selenium::WebDriver::Wait.new(:timeout => 10)
    end

    # def category_page_asserts
    #     @category_page_asserts || PageModels::CategoryPageAsserts.new
    # end

    def order_page
        @order_page || PageModels::OrderPage.new
    end

end

World(KnowsMyWorld)
World(KnowsAboutConfig)