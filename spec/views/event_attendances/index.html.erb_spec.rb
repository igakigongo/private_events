require 'rails_helper'

RSpec.describe 'event_attendances/index', type: :view do
  before(:each) do
    assign(:event_attendances, [
             EventAttendance.create!,
             EventAttendance.create!
           ])
  end

  it 'renders a list of event_attendances' do
    render
  end
end
