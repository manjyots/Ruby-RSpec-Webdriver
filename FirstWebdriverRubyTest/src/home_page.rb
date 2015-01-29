require_relative '../src/abstract_page'
require_relative '../src/login_page'

class HomePage < AbstractPage

  def initialize(driver)
    super(driver)
  end


  def navigateToLoginPage
    @@driver.find_element(:link, "Follow").click
    return LoginPage.new(@@driver)
  end
end