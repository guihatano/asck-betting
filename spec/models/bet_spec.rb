# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Bet, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:event) { FactoryBot.create(:event) }

  it 'is valid with a value, predicted_result, and status' do
    bet = described_class.new(
      value: 10,
      predicted_result: 'Test Result',
      actual_result: 'Test Result',
      status: 0,
      user: user,
      event: event
    )
    expect(bet).to be_valid
  end

  it 'is invalid without a value' do
    bet = described_class.new(value: nil)
    bet.valid?
    expect(bet.errors[:value]).to include("can't be blank")
  end

  it 'is invalid without a predicted_result' do
    bet = described_class.new(predicted_result: nil)
    bet.valid?
    expect(bet.errors[:predicted_result]).to include("can't be blank")
  end
end
