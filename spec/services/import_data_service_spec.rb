require "rails_helper"

RSpec.describe ImportDataService do
  let(:import_file) { create(:import_file) }
  let(:service) { described_class.new(import_file) }

  describe "#call" do
    it "creates orders" do
      expect { described_class.call(import_file) }.to change(Order, :count).by(5)
    end

    it "creates purchasers" do
      expect { described_class.call(import_file) }.to change(Purchaser, :count).by(4)
    end

    it "creates merchants" do
      expect { described_class.call(import_file) }.to change(Merchant, :count).by(3)
    end

    it "updates total amount" do
      described_class.call(import_file)

      expect(import_file.total_amount).to eq(37.95)
    end

    context "when file is empty" do
      let(:import_file) { create(:import_file, :with_error) }

      it "does not create orders" do
        expect { described_class.call(import_file) }.not_to change(Order, :count)
      end

      it "does not create purchasers" do
        expect { described_class.call(import_file) }.not_to change(Purchaser, :count)
      end

      it "does not create merchants" do
        expect { described_class.call(import_file) }.not_to change(Merchant, :count)
      end

      it "does not update total amount" do
        described_class.call(import_file)

        expect(import_file.total_amount).to eq(0.0)
      end
    end
  end
end
