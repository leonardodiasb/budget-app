require 'rails_helper'

RSpec.describe 'Entity Page', type: :features do
  before(:each) do
    @user = create(:user)
    @group = create(:group, user_id: @user.id)
    @entity1 = create(:entity, user_id: @user.id)
    @entity2 = create(:entity, user_id: @user.id)
    @group.entities << @entity1
    @group.entities << @entity2
    visit '/users/sign_in'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Log in'
    visit "/users/#{@user.id}/groups/#{@group.id}"
  end
  describe 'Contains' do
    it 'I can see the title' do
      expect(page).to have_content('TRANSACTIONS')
    end
  end

  describe 'When I click the Add transaction button' do
    it 'I get a page with a form to add a transaction' do
      find('a', text: 'Add Transaction').click
      expect(page).to have_content('NEW TRANSACTION')
      expect(page).to have_selector("input[type=submit][value='Save']")
      expect(page).to have_field('Name')
      expect(page).to have_field('Amount')
    end
  end

  describe 'Add a new transaction' do
    it 'I can see the new transaction in the page' do
      find('a', text: 'Add Transaction').click
      fill_in 'Name', with: 'Bread'
      fill_in 'Amount', with: 9.99
      click_button 'Save'
      expect(page).to have_content('Bread')
      expect(page).to have_content(9.99)
    end
  end

  describe 'Entity show page' do
    it 'I can go to a entity details page' do
      find('a', text: @entity1.name).click
      expect(page).to have_content(@entity1.name)
      expect(page).to have_content(@entity1.amount)
    end
  end
end
