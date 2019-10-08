require 'rails_helper'

RSpec.describe 'events/edit', type: :view do
  let!(:user) do
    User.create!(name: 'Edward')
  end

  let!(:evt) do
    Event.create!(date: '2020-12-01',
                  title: 'Some randon event',
                  creator: user)
  end

  before(:each) do
    @event = assign(:event, evt)
  end

  it 'renders the edit event form' do
    render

    assert_select 'form[action=?][method=?]', event_path(@event), 'post' do
    end
  end
end
