# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name, email, and default points" do
    user = User.new(
      name: "Test User",
      email: "test@example.com",
      points: 0,
      ranking: 0
    )
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is invalid without an email" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do
    User.create(
      name: "Joe",
      email: "tester@example.com",
      points: 0,
      ranking: 0
    )
    user = User.new(
      name: "Jane",
      email: "tester@example.com",
      points: 0,
      ranking: 0
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end
