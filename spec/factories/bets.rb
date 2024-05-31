FactoryBot.define do
  factory :bet do
    value { 1 }
    predicted_result { "MyString" }
    actual_result { "MyString" }
    status { 1 }
    user { nil }
    event { nil }
  end
end
