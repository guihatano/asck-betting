require 'rails_helper'

RSpec.describe 'events/edit', type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      name: 'MyString',
      description: 'MyText',
      status: 1,
      date: Time.zone.now
    ))
  end

  it 'renders the edit event form' do
    render

    assert_select 'form[action=?][method=?]', event_path(@event), 'post' do

      assert_select 'input[name=?]', 'event[name]'

      assert_select 'textarea[name=?]', 'event[description]'

      assert_select 'input[name=?]', 'event[status]'
    end
  end
end
