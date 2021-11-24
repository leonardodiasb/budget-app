require 'rails_helper'

RSpec.describe Entity, type: :model do
  let!(:user) { create(:user) }

  describe 'Entity model' do
    before :each do
      @entity = build(:entity)
      @entity.user = user
    end

    it 'should be valid' do
      expect(@entity).to be_valid
    end

    it 'should not be valid with empty fields' do
      @entity.name = nil
      expect(@entity).to_not be_valid
    end

    it 'should not be valid with empty fields' do
      @entity.amount= nil
      expect(@entity).to_not be_valid
    end

    it 'should not be valid with incorrect numerical values' do
      @entity.amount = -1
      expect(@entity).to_not be_valid
    end
  end
end
