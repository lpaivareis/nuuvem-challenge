FactoryBot.define do
  factory :order do
    item_description { Faker::Lorem.sentence }
    item_price { Faker::Commerce.price }

    purchaser { create(:purchaser) }
    merchant { create(:merchant) }
  end
end
