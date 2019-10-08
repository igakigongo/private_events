require 'rails_helper'

RSpec.describe 'events/show', type: :view do
  let!(:user) do
    User.create!(name: 'Edward')
  end

  let!(:evt) do
    Event.create!(date: '2020-12-01',
                  title: 'Some randon event',
                  user: user)
  end

  before(:each) do
    @event = assign(:event, evt)
  end

  it 'renders attributes in <p>' do
    render
  end
end
