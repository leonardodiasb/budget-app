require 'rails_helper'

RSpec.describe 'Home Page', type: :features do
  
  describe 'Register' do
    before(:each) do
      visit '/'
    end
    it 'I can see the app name.' do
      expect(page).to have_content('Budget Rails App')
    end

    it 'I can see the Log in button.' do
      expect(page).to have_content('LOG IN')
    end

    it 'I can see the Sign up button.' do
      expect(page).to have_content('SIGN UP')
    end

    it 'I can go to the registration page clicking on the Sign up button' do
      find('a', text: 'SIGN UP').click
      expect(page).to have_content('REGISTER')
      expect(page).to have_field('Name')
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
    end

    it 'I can register a new user' do
      find('a', text: 'SIGN UP').click
      fill_in 'Name', with: 'User'
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
      fill_in 'Password Confirmation', with: '123456'
      click_button 'Sign up'
      expect(page).to have_content('CATEGORIES')
    end
  end
  describe 'Login' do
    before(:each) do
      visit '/'
      @user = create(:user)
    end

    it 'I can log in with user' do
      find('a', text: 'LOG IN').click
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      expect(page).to have_content('CATEGORIES')
    end
  end
end
