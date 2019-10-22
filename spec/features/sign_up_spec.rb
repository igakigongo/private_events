require 'rails_helper'

# how do we apply ordering to this spec alone
# RSpec.feature <feature_name>, order: :defined do - let's use below as an example
# RSpec.feature 'signing_up', order: :defined do
# end

RSpec.feature 'signing up', order: :defined do

  scenario 'should allow a user whose name does not exist in the system to sign up' do
    visit new_user_path
    fill_in 'Name', with: 'Edward'
    click_on('Save')

    expect(page).to have_content('Edward')
  end

  given(:other_user) { User.new(name: 'edward') }

  scenario 'should reject a user if the name is already taken up' do
    User.create(name: 'Edward')
    visit new_user_path
    fill_in 'Name', with: other_user.name

    click_on('Save')
    expect(page).to have_content('The desired name is already taken up')
  end
end
