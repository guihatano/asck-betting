require 'rails_helper'

RSpec.describe 'bets/show', type: :view do
  let(:user) { FactoryBot.create(:user) }
  let(:event) { FactoryBot.create(:event) }

  before(:each) do
    @bet = assign(:bet, Bet.create!(
      value: 2,
      predicted_result: 'Predicted Result',
      actual_result: 'Actual Result',
      status: :pending,
      user: user,
      event: event
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Predicted Result/)
    expect(rendered).to match(/Actual Result/)
    expect(rendered).to match(/pending/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
