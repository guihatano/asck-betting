# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { 'Test Event' }
    description { 'Test Description' }
    date { DateTime.now }
    status { 0 }
  end
end
