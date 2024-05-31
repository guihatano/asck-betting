require 'rails_helper'

RSpec.describe "bets/new", type: :view do
  before(:each) do
    assign(:bet, Bet.new(
      value: 1,
      predicted_result: "MyString",
      actual_result: "MyString",
      status: 1,
      user: nil,
      event: nil
    ))
  end

  it "renders new bet form" do
    render

    assert_select "form[action=?][method=?]", bets_path, "post" do

      assert_select "input[name=?]", "bet[value]"

      assert_select "input[name=?]", "bet[predicted_result]"

      assert_select "input[name=?]", "bet[actual_result]"

      assert_select "input[name=?]", "bet[status]"

      assert_select "input[name=?]", "bet[user_id]"

      assert_select "input[name=?]", "bet[event_id]"
    end
  end
end
