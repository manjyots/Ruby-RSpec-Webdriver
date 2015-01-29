#Test using test unit
require "selenium-webdriver"
require 'rubygems'
gem 'test-unit'
require 'test/unit'


class MyFirstRubyTest < Test::Unit::TestCase

  def setup
#Firefox browser instantiation
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "http://www.assertselenium.com"
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
    @driver.find_element(:link, "Follow").click
    @driver.find_element(:id, "user_login").send_keys "sampleuser77dff28"
    @driver.find_element(:id, "user_email").send_keys "sampleuser7f7df28@gmail.com"
    @driver.find_element(:id, "wp-submit").click

    wait_for { displayed?(:id, "login_error")}
    loginerror = @driver.find_element(:id, "login_error")

    if loginerror
      assert(loginerror.text.include?("ERROR: This username is already registered. Please choose another one"), "the assert works for incorrect username")
      assert(loginerror.text.include?("ERROR: This email is already registered, please choose another one"), "the assert works for incorrect email")
    end
    puts "Successfully completed the user registration and validated the Success message"
  end

  def teardown
    @driver.quit
  end

end