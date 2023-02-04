class Merchant < ApplicationRecord
  validates :name, :address, presence: true

  belongs_to :order
end
