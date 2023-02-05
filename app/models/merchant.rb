class Merchant < ApplicationRecord
  validates :name, :address, presence: true

  has_many :orders, dependent: :destroy
end
