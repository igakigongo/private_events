require 'rails_helper'

# skip model validations for event - since they are covered by
# backing tests in model_specs
RSpec.feature 'editing an event' do
  before do
    @edward = User.create(name: 'Edward')
    @robert = User.create(name: 'Robert')
    @event = @edward.events.build(date: '2019/12/31', title: 'The good, the bad and the ugly')
    @event.save
  end

  it 'should succeed if user owns the event' do
    sign_in_and_test_path_for(@edward)

    # navigate to register event page - several clicks here
    visit edit_event_path(@event)
    expect(page).to have_current_path(edit_event_path(@event))

    new_title = 'The good, the bad and the ugly movie review'
    fill_in 'event[title]', with: new_title
    click_on('save')

    @event.reload
    expect(@event.title).to eq new_title
    expect(page).to have_content('Event was successfully updated.')
    expect(page).to have_current_path(event_path(@event))
  end

  it 'should redirect to events page if user does not own event' do
    sign_in_and_test_path_for(@robert)

    # request editing an event that was not created by robert
    visit edit_event_path(@event)
    expect(page).to have_current_path(events_path)
    expect(page).to have_content('You attempted to modify a resource that does not belong to you')
  end
end
