# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Test User' }
    email { 'test@example.com' }
    points { 0 }
    ranking { 0 }
    password { '12345678' }
  end
end
