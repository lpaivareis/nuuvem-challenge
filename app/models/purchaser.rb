class Purchaser < ApplicationRecord
  validates :name, :purchase_count, presence: true

  has_many :orders, dependent: :destroy
end
