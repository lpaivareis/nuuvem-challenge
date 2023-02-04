FactoryBot.define do
  factory :order do
    item_description { Faker::Lorem.sentence }
    item_price { Faker::Commerce.price }

    association :import_file
  end
end
