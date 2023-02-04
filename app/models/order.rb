class Order < ApplicationRecord
  validates :item_description, :item_price, presence: true

  belongs_to :import_file

  has_one :purchaser, dependent: :destroy
  has_one :merchant, dependent: :destroy
end
