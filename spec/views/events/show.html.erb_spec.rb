# spec/views/events/show.html.erb_spec.rb
require 'rails_helper'

RSpec.describe 'events/show', type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      name: 'Name',
      description: 'MyText',
      date: DateTime.now,
      status: :completed
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/completed/)
  end
end
