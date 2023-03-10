require "rails_helper"

RSpec.describe Purchaser do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:purchase_count) }
  end

  describe "associations" do
    it { is_expected.to have_many(:orders).dependent(:destroy) }
  end
end
