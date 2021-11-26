require 'rails_helper'

RSpec.describe 'Group Page', type: :features do
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
    visit '/'
  end
  describe 'Contains' do
    it 'I can see the title' do
      expect(page).to have_content('CATEGORIES')
    end

    it 'I can see the add category link' do
      expect(page).to have_link('Add Category')
    end
  end

  describe 'When I click the Add category button' do
    it 'I get a page with a form to add a category' do
      find('a', text: 'Add Category').click
      expect(page).to have_content('NEW CATEGORY')
      expect(page).to have_selector("input[type=submit][value='Save']")
      expect(page).to have_field('Name')
      expect(page).to have_field('Icon')
    end
  end

  describe 'Add a new category' do
    it 'I can see the new category in the page' do
      find('a', text: 'Add Category').click
      fill_in 'Name', with: 'Bus to work'
      select 'Transportation', from: 'group_icon'
      click_button 'Save'
      expect(page).to have_content('Bus to work')
    end
  end

  describe 'Group show page' do
    it 'I can go to a specific category page' do
      find('a', text: @group.name).click
      expect(page).to have_content(@entity1.name)
      expect(page).to have_content(@entity2.name)
    end
  end
end
