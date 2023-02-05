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

    context "when there is an error" do
      before do
        allow_any_instance_of(ImportFile).to receive(:update!).and_raise(StandardError)
      end

      it "logs the error" do
        expect(Rails.logger).to receive(:error)

        described_class.call(import_file)
      end
    end
  end
end
