require 'rspec'
require_relative '../src/home_page'

RSpec.describe 'Testing the assert site' do

  app = nil;

  before :each do
    app = AbstractPage.new(Selenium::WebDriver.for(:firefox))
  end

  it 'to test navigation to login page and then fill login details' do

    loginPage = app
                    .navigateToAppHome
                    .navigateToLoginPage
                    .fillInLogin('sampleuser77dff28')
                    .fillInEmail('sampleuser7f7df28@gmail.com')
                    .submitForm

    expect(loginPage.getErrorMessages).to eq 'ERROR: This username is already registered. Please choose another one.
ERROR: This email is already registered, please choose another one.'

  end

  after(:each) do
    app.quit
  end

end