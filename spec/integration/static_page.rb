require 'rails_helper'

RSpec.describe "root path", type: :feature do
  describe 'home path' do
    before { visit root_path }
    it 'have link' do
      expect(page).to have_link('Startup')
      expect(page).to have_link('About')
      expect(page).to have_link('Services')
      expect(page).to have_link('Contacts')   
      expect(page).to have_link('Sign up')   
    end

    it 'sign up' do 
      click_link 'Sign up'
      expect(page).to have_selector('h2', :text => 'Sign up')
    end

    it 'sign up have link sign in' do
      click_link 'Sign up'
      expect(page).to have_selector('p', text: "Already")
    end
  end

  describe 'authentication' do
    it 'display user name' do
      user = FactoryBot.create(:user) 
      visit '/sign_in'
      fill_in "Email",	with: "example@example.com"
      fill_in "Password", with: "foobar12"
      click_button(class: %w(btn btn-primary btn-xl))
      expect(page).to have_selector('.d-block', :text => 'Foo Bar') 
    end
  end

end
