require 'rails_helper'

RSpec.describe 'event_attendances/show', type: :view do
  before(:each) do
    @event_attendance = assign(:event_attendance, EventAttendance.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
