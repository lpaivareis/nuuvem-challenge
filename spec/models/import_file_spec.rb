require "rails_helper"

RSpec.describe ImportFile do
  describe "validations" do
    it { is_expected.to validate_presence_of(:file) }
    it { is_expected.to validate_presence_of(:total_amount) }
  end

  describe "associations" do
    context "when file is attached" do
      subject { create(:import_file).file }

      it { is_expected.to be_an_instance_of(ActiveStorage::Attached::One) }
    end
  end
end
