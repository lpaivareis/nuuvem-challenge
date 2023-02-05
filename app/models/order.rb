class Order < ApplicationRecord
  validates :item_description, :item_price, presence: true

  belongs_to :import_file, optional: true
  belongs_to :purchaser
  belongs_to :merchant
end
