require 'rails_helper'

RSpec.describe "bets/index", type: :view do
  before(:each) do
    assign(:bets, [
      Bet.create!(
        value: 2,
        predicted_result: "Predicted Result",
        actual_result: "Actual Result",
        status: 3,
        user: nil,
        event: nil
      ),
      Bet.create!(
        value: 2,
        predicted_result: "Predicted Result",
        actual_result: "Actual Result",
        status: 3,
        user: nil,
        event: nil
      )
    ])
  end

  it "renders a list of bets" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Predicted Result".to_s, count: 2
    assert_select "tr>td", text: "Actual Result".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
