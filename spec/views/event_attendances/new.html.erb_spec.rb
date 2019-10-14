require 'rails_helper'

RSpec.describe 'event_attendances/new', type: :view do
  before(:each) do
    assign(:event_attendance, EventAttendance.new)
  end

  it 'renders new event_attendance form' do
    render

    assert_select 'form[action=?][method=?]', event_attendances_path, 'post' do
    end
  end
end
