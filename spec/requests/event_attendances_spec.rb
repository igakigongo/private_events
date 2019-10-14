require 'rails_helper'

RSpec.describe 'EventAttendances', type: :request do
  describe 'GET /event_attendances' do
    it 'works! (now write some real specs)' do
      get event_attendances_path
      expect(response).to have_http_status(200)
    end
  end
end
