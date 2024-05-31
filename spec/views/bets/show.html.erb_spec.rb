require 'rails_helper'

RSpec.describe "bets/show", type: :view do
  before(:each) do
    @bet = assign(:bet, Bet.create!(
      value: 2,
      predicted_result: "Predicted Result",
      actual_result: "Actual Result",
      status: 3,
      user: nil,
      event: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Predicted Result/)
    expect(rendered).to match(/Actual Result/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
