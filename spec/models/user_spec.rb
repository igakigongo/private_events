require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(name: 'Edward')
    expect(user).to be_valid
  end

  it 'is invalid without a username' do
    user = User.new
    expect(user).to be_invalid
  end
end
