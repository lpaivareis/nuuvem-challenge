class Purchaser < ApplicationRecord
  validates :name, :purchase_count, presence: true

  belongs_to :order
end
