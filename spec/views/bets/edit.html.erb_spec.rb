require 'rails_helper'

RSpec.describe "bets/edit", type: :view do
  before(:each) do
    @bet = assign(:bet, Bet.create!(
      value: 1,
      predicted_result: "MyString",
      actual_result: "MyString",
      status: 1,
      user: nil,
      event: nil
    ))
  end

  it "renders the edit bet form" do
    render

    assert_select "form[action=?][method=?]", bet_path(@bet), "post" do

      assert_select "input[name=?]", "bet[value]"

      assert_select "input[name=?]", "bet[predicted_result]"

      assert_select "input[name=?]", "bet[actual_result]"

      assert_select "input[name=?]", "bet[status]"

      assert_select "input[name=?]", "bet[user_id]"

      assert_select "input[name=?]", "bet[event_id]"
    end
  end
end
