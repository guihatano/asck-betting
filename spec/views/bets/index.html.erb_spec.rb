require 'rails_helper'

RSpec.describe 'bets/index', type: :view do
  let(:user) { FactoryBot.create(:user) }
  let(:event) { FactoryBot.create(:event) }

  before(:each) do
    assign(
      :bets,
      [
        Bet.create!(
          value: 2,
          predicted_result: 'Predicted Result',
          actual_result: 'Actual Result',
          status: :won,
          user: user,
          event: event
        ),
        Bet.create!(
          value: 2,
          predicted_result: 'Predicted Result',
          actual_result: 'Actual Result',
          status: :lost,
          user: user,
          event: event
        )
      ]
    )
  end

  it 'renders a list of bets' do
    render
    assert_select 'tr>td', text: '2'.to_s, count: 2
    assert_select 'tr>td', text: 'Predicted Result'.to_s, count: 2
    assert_select 'tr>td', text: 'Actual Result'.to_s, count: 2
    assert_select 'tr>td', text: 'won'.to_s, count: 1
    assert_select 'tr>td', text: 'lost'.to_s, count: 1
    assert_select 'tr>td', text: 'Test User'.to_s, count: 2
    assert_select 'tr>td', text: 'Test Event'.to_s, count: 2
  end
end
