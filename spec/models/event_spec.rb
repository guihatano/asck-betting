# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'is valid with a name and date' do
    event = described_class.new(
      name: 'Test Event',
      description: 'Test Description',
      date: DateTime.now,
      status: 0
    )
    expect(event).to be_valid
  end

  it 'is invalid without a name' do
    event = described_class.new(name: nil)
    event.valid?
    expect(event.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a date' do
    event = described_class.new(date: nil)
    event.valid?
    expect(event.errors[:date]).to include("can't be blank")
  end
end
