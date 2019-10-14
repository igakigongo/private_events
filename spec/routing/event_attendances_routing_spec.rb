require 'rails_helper'

RSpec.describe EventAttendancesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/event_attendances').to route_to('event_attendances#index')
    end

    it 'routes to #new' do
      expect(get: '/event_attendances/new').to route_to('event_attendances#new')
    end

    it 'routes to #show' do
      expect(get: '/event_attendances/1').to route_to('event_attendances#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/event_attendances/1/edit').to route_to('event_attendances#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/event_attendances').to route_to('event_attendances#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/event_attendances/1').to route_to('event_attendances#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/event_attendances/1').to route_to('event_attendances#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/event_attendances/1').to route_to('event_attendances#destroy', id: '1')
    end
  end
end
