# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name, email, and default points' do
    user = described_class.new(
      name: 'Test User',
      email: 'test@example.com',
      password: '123456',
      points: 0,
      ranking: 0
    )
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user = described_class.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without an email' do
    user = described_class.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'is invalid with a duplicate email address' do
    described_class.create(
      name: 'Joe',
      email: 'tester@example.com',
      password: '123456',
      points: 0,
      ranking: 0
    )
    user = described_class.new(
      name: 'Jane',
      email: 'tester@example.com',
      password: '123456',
      points: 0,
      ranking: 0
    )
    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end
end
