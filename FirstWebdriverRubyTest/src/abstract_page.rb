gem 'rspec'
require 'rspec'
require 'selenium-webdriver'
require 'rubygems'
gem 'test-unit'
require 'test/unit'
require_relative '../src/home_page'

class AbstractPage

  @@driver = nil

  def initialize(driver)
    @@driver = driver
    @@driver.manage.timeouts.implicit_wait = 120
  end

  def navigateToAppHome
    @@driver.navigate.to('http://www.assertselenium.com')
    return HomePage.new(@@driver)
  end

  def quit
    @@driver.quit
  end

  def getPageTitle
    @@driver.title
  end


end