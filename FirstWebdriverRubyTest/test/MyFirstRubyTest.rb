#Test using test unit
require "selenium-webdriver"
require 'rubygems'
gem 'test-unit'
require 'test/unit'


class MyFirstRubyTest < Test::Unit::TestCase

  def setup
#Firefox browser instantiation
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "http://selenium-tester.herokuapp.com/users"
    @verification_errors = []
    @driver.manage.timeouts.implicit_wait = 120
  end

  def wait_for(seconds=120)
    Selenium::WebDriver::Wait.new(:timeout => seconds).until { yield }
  end

  def displayed?(how, what)
    @driver.find_element(how, what).displayed?
  end

  def test_sample
    @driver.get(@base_url)
    @driver.find_element(:link, "New User").click
    @driver.find_element(:id, "user_firstName").send_keys "firstname"
    @driver.find_element(:id, "user_lastName").send_keys "lastname"
    @driver.find_element(:id, "user_emailAddr").send_keys "email@email.com"
    @driver.find_element(:id, "user_username").send_keys "username"
    @driver.find_element(:id, "user_password").send_keys "password"
    @driver.find_element(:id, "user_phone").send_keys "9878675467"
    @driver.find_element(:id, "user_address").send_keys "address"
    @driver.find_element(:id, "user_postcode").send_keys "110056"
    @driver.find_element(:id, "user_sex").send_keys "M"
    @driver.find_element(:id, "user_comments").send_keys "comments"
    @driver.find_element(:id, "user_tnc").click
    @driver.find_element(:name, "commit").click



    # wait_for { displayed?(:id, "login_error")}
    loginerror = @driver.find_element(:xpath, "//div[@id='error_explanation']/ul/li")

    if loginerror
      assert(loginerror.text.include?("Username has already been taken"), "the assert works for dup username")
          end
    puts "Successfully completed the user registration and validated the Success message"
  end

  def teardown
    @driver.quit
  end

end