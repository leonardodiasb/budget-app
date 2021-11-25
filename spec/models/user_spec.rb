require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = build(:user)
  end

  it 'should be valid' do
    expect(@user).to be_valid
  end

  it 'should not be valid without name' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'should not be valid with incorrect email' do
    @user.email = '@notvalid.com'
    expect(@user).to_not be_valid
  end
end
