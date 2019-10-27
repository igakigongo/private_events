require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @user = User.create(name: 'Edward')
  end

  it 'is valid with valid attributes' do
    event = @user.events.build(date: Date.parse('17-12-2019'), title: 'My birthday')
    expect(event).to be_valid
  end

  it 'is invalid without a date' do
    event = @user.events.build(title: 'My birthday')
    expect(event).to be_invalid
    expect(event.errors.messages[:date]).to eq ['can\'t be blank']
  end

  it 'is invalid without a title' do
    event = @user.events.build(date: Date.parse('17-12-2019'))
    expect(event).to be_invalid
    expect(event.errors.messages[:title]).to eq ['can\'t be blank']
  end

  it 'is invalid without a user_id' do
    event = Event.create(date: Date.parse('17-12-2019'), title: 'My birthday')
    expect(event).to be_invalid
    expect(event.errors.messages[:creator]).to eq ['must exist']
  end
end
