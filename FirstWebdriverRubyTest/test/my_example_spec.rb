# Test using RSpec
require 'rspec'
require_relative '../src/home_page'

RSpec.describe 'Testing the assert site' do

  app = nil;

  before :each do
    app = AbstractPage.new(Selenium::WebDriver.for(:firefox))
  end

  it 'to test navigation to login page and then fill login details' do

    loginPage = app
                    .navigate_to_app_home
                    .navigate_to_login_page
                      .fill_in_login('sampleuser77dff28')
                      .fill_in_email('sampleuser7f7df28@gmail.com')
                      .submit_form

    expect(loginPage.get_error_messages).to eq 'ERROR: This username is already registered. Please choose another one.
ERROR: This email is already registered, please choose another one.'

  end

  after(:each) do
    app.quit
  end

end