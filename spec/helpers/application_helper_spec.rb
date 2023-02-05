require "rails_helper"

RSpec.describe ApplicationHelper do
  describe "#import_title" do
    let(:import) { create(:import_file) }

    it "returns a string with the import created_at" do
      expect(helper.import_title(import))
        .to eq("Arquivo importado em (#{import.created_at.strftime('%d/%m/%Y - %H:%M:%S')})")
    end
  end

  describe "#import_total_amount" do
    context "when there are no imports" do
      it "returns a string with the value zero" do
        expect(helper.import_total_amount(nil)).to eq("R$0,00")
      end
    end

    context "when there are imports" do
      let!(:imports) { create_list(:import_file, 2, :total_amount) }

      it "returns a string with the total amount of all imports" do
        expect(helper.import_total_amount(imports)).to eq("R$30,00")
      end
    end
  end

  describe "#import_last_import_amount" do
    context "when there are no imports" do
      it "returns a string with the value zero" do
        expect(helper.import_last_import_amount(nil)).to eq("R$0,00")
      end
    end

    context "when there are imports" do
      let!(:import) { create(:import_file, :total_amount) }

      it "returns a string with the total amount of the last import" do
        expect(helper.import_last_import_amount(import)).to eq("R$15,00")
      end
    end
  end

  describe "#format_import_item_price" do
    it "returns a string with the item price formatted" do
      expect(helper.format_import_item_price(10)).to eq("R$10,00")
    end

    context "when the item price is zero" do
      it "returns a string with the item price formatted" do
        expect(helper.format_import_item_price(0)).to eq("R$0,00")
      end
    end
  end
end
