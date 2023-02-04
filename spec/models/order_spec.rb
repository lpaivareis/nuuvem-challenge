require "rails_helper"

RSpec.describe Order do
  describe "validations" do
    it { is_expected.to validate_presence_of(:item_description) }
    it { is_expected.to validate_presence_of(:item_price) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:import_file) }
    it { is_expected.to have_one(:purchaser).dependent(:destroy) }
    it { is_expected.to have_one(:merchant).dependent(:destroy) }
  end
end
