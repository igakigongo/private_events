require 'rails_helper'

RSpec.describe 'event_attendances/edit', type: :view do
  before(:each) do
    @event_attendance = assign(:event_attendance, EventAttendance.create!)
  end

  it 'renders the edit event_attendance form' do
    render

    assert_select 'form[action=?][method=?]', event_attendance_path(@event_attendance), 'post' do
    end
  end
end
