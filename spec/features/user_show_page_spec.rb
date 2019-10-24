require 'rails_helper'

RSpec.feature 'user show page' do
  before do
    @edward = User.create(name: 'Edward')
    @robert = User.create(name: 'Robert')
    @event = @edward.events.build(date: Date.parse('17-12-2020'), title: 'Celebration of my birthday')
    @event.save
  end

  scenario 'should show events created by the user' do
    visit user_path(@edward)
    expect(page).to have_content('Created Event')
    expect(page).to have_content(@event.title)
  end

  scenario 'should show the text `Info: No created events found` if user has never created any events' do
    visit user_path(@robert)
    expect(page).to have_content('Info: No created events found')
  end

  scenario 'should display user attendences if any exist' do
    # make robert attend the event
    ea = @robert.event_attendances.build(event_id: @event.id)
    ea.save

    # visit robert's show page and assert that the attended event is listed
    visit user_path(@robert)
    expect(page).to have_content(@event.title)
  end

  scenario 'should show the text `Info: No planned/attended events found` if user has no attendances' do
    visit user_path(@edward)
    expect(page).to have_content('Info: No planned/attended events found')
  end
end
