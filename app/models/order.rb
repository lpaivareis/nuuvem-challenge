class Order < ApplicationRecord
  validates :item_description, :item_price, presence: true

  belongs_to :import_file
  belongs_to :purchaser
  belongs_to :merchant
end
