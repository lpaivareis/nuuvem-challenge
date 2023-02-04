class ImportFile < ApplicationRecord
  has_one_attached :file

  validates :file, presence: true
  validates :total_amount, presence: true
end
