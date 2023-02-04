FactoryBot.define do
  factory :merchant do
    merchant_name { Faker::Company.name }
    merchant_address { Faker::Address.street_address }

    association :order
  end
end
