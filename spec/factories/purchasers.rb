FactoryBot.define do
  factory :purchaser do
    name { Faker::Name.name }
    purchase_count { Faker::Number.number(2) }

    association :order
  end
end
