require 'rails_helper'

RSpec.describe EventAttendance, type: :model do
  before do
    @user = User.create(name: 'Edward')
    @event = @user.events.build(date: Date.parse('17-12-2019'), title: 'My custom birthday')
    @event.save
  end

  it 'is valid with valid attributes' do
    attendance = EventAttendance.new(event_id: @event.id, user_id: @user.id)
    expect(attendance).to be_valid
  end

  it 'is invalid without an attendee' do
    attendance = EventAttendance.new(event_id: @event.id)
    expect(attendance).to be_invalid
    expect(attendance.errors.messages[:attendee]).to eq ['must exist']
  end

  it 'is invalid without an event' do
    attendance = EventAttendance.new(user_id: @user.id)
    expect(attendance).to be_invalid
    expect(attendance.errors.messages[:event]).to eq ['must exist']
  end
end
