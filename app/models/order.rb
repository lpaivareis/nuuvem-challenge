class Order < ApplicationRecord
  belongs_to :import_file

  has_one :purchaser
  has_one :merchant
end
