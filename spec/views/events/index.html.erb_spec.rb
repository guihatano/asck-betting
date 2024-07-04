# spec/views/events/index.html.erb_spec.rb
require 'rails_helper'

RSpec.describe 'events/index', type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        name: 'Name',
        description: 'MyText',
        date: DateTime.now,
        status: :completed
      ),
      Event.create!(
        name: 'Name2',
        description: 'MyText',
        date: DateTime.now,
        status: :ongoing
      )
    ])
  end

  it 'renders a list of events' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 1
    assert_select 'tr>td', text: 'Name2'.to_s, count: 1
  end
end
