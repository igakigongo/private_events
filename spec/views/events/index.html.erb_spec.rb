require 'rails_helper'

RSpec.describe 'events/index', type: :view do
  let!(:user) do
    User.create!(name: 'Edward')
  end
  before(:each) do
    assign(:events, [
             Event.create!(date: '2020-01-01', title: 'event 1', user: user),
             Event.create!(date: '2020-02-02', title: 'event 2', user: user)
           ])
  end

  it 'renders a list of events' do
    render
  end
end
