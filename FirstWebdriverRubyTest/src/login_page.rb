require_relative '../src/abstract_page'

class LoginPage < AbstractPage

  def initialize(driver)
    super(driver)
  end

  def fill_in_login(login)
    @@driver.find_element(:id, "user_login").send_keys login
    return LoginPage.new(@@driver)
  end

  def fill_in_email(email)
    @@driver.find_element(:id, "user_email").send_keys email
    return LoginPage.new(@@driver)
  end

  def submit_form
    @@driver.find_element(:id, "wp-submit").click
    return LoginPage.new(@@driver)
  end

  def get_error_messages()
    loginError = @@driver.find_element(:id, "login_error")
    return loginError.text
  end

end