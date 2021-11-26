require 'rails_helper'

RSpec.describe Group, type: :model do
  let!(:user) { create(:user) }

  describe 'Group model' do
    before :each do
      @group = build(:group)
      @group.user = user
    end

    it 'should be valid' do
      expect(@group).to be_valid
    end

    it 'should not be valid with empty fields' do
      @group.name = nil
      expect(@group).to_not be_valid
    end

    it 'should not be valid with empty fields' do
      @group.icon = nil
      expect(@group).to_not be_valid
    end

    it 'icon_img method should return bootstrap icon class' do
      expect(@group.icon_img).to eq('basket3')
    end
  end
end
