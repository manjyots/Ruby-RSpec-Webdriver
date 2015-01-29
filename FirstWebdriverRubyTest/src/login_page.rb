require_relative '../src/abstract_page'

class LoginPage < AbstractPage

  def initialize(driver)
    super(driver)
  end

  def fillInLogin(login)
    @@driver.find_element(:id, "user_login").send_keys login
    return LoginPage.new(@@driver)
  end

  def fillInEmail(email)
    @@driver.find_element(:id, "user_email").send_keys email
    return LoginPage.new(@@driver)
  end

  def submitForm
    @@driver.find_element(:id, "wp-submit").click
    return LoginPage.new(@@driver)
  end

  def getErrorMessages()
    loginError = @@driver.find_element(:id, "login_error")
    return loginError.text
  end

end