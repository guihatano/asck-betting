# frozen_string_literal: true

FactoryBot.define do
  factory :bet do
    value { 10 }
    predicted_result { 'Test Result' }
    actual_result { 'Test Result' }
    status { 0 }
    association :user
    association :event
  end
end
