require 'rails_helper'

RSpec.feature 'creating an event' do
  before do
    @edward = User.create(name: 'Edward')
    @robert = User.create(name: 'Robert')
  end

  it 'should succeed if user is authenticated' do
    # model validation skipped since we did this in model specs
    # sign in user
    visit signin_path
    fill_in 'name', with: 'edward'
    click_on('Authenticate')
    path = "/users/#{@edward.id}"
    expect(page).to have_current_path(path)

    # navigate to register event page - several clicks here
    click_on('Upcoming Events')
    click_on('New Event')
    expect(page).to have_content('Register an Event')

    fill_in 'Title', with: 'Random Event'
    fill_in 'event[date]', with: '2019/12/31'
    click_on('save')

    expect(page).to have_content('Event was successfully created.')
    expect(page).to have_content('Random Event')
    expect(page).to have_content("Created/Organized By: #{@edward.name}")
  end

  it 'should redirect to login page if user is not authenticated' do
    visit new_event_path
    # make sure user is redirected to login page
    expect(page).to have_current_path(signin_path)
    expect(page).to have_content('You need to sign in before carrying out the intended action')
  end
end
