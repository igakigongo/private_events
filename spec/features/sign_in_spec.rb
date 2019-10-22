require 'rails_helper'

RSpec.feature 'signing in' do
  before do
    User.create!(name: 'Edward')
  end

  scenario 'should allow an existing user to sign in' do
    visit signin_path
    fill_in 'Name', with: 'edward'

    click_on('Authenticate')
    expect(page).to have_content('Edward')
  end

  scenario 'should deny a user with an invalid username' do
    visit signin_path
    fill_in 'Name', with: 'Kimbuggwe'

    click_on('Authenticate')
    expect(page).to have_content('Invalid ID or Name')
  end
end
