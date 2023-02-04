require "rails_helper"

RSpec.describe "ImportFiles" do
  describe "GET /index" do
    before do
      create(:import_file)
    end

    it "renders a successful response" do
      get import_files_url

      expect(response).to be_successful
    end

    context "when there are no import files" do
      before do
        ImportFile.destroy_all
      end

      it "renders a successful response" do
        get import_files_url

        expect(response).to be_successful
      end
    end
  end

  describe "GET /show" do
    let(:import_file) { create(:import_file) }

    it "renders a successful response" do
      get import_file_url(import_file)

      expect(response).to be_successful
    end

    context "when the import file does not exist" do
      it "raises an error" do
        expect { get import_file_url(0) }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_import_file_url

      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    let(:params) do
      {
        import_file: {
          file: fixture_file_upload("spec/fixtures/files/example_input.tab"),
          total_amount: 100.0
        }
      }
    end

    it "creates a new ImportFile" do
      expect { post import_files_url, params: params }.to change(ImportFile, :count).by(1)
    end

    it "redirects to the created import_file" do
      post import_files_url, params: params

      expect(response).to redirect_to(import_file_url(ImportFile.last))
    end

    it "returns a success message" do
      post import_files_url, params: params

      expect(flash[:notice]).to eq("Import file was successfully created.")
    end

    context "when the import file is invalid" do
      let(:params) do
        {
          import_file: {
            file: nil,
            total_amount: nil
          }
        }
      end

      it "does not create a new ImportFile" do
        expect { post import_files_url, params: params }.not_to change(ImportFile, :count)
      end

      # todo - fix this
      # it "renders a error message" do
      #   post import_files_url, params: params

      #   expect(flash[:notice]).to eq("Import file was not created.")
      # end
    end
  end

  describe "GET destroy" do
    let!(:import_file) { create(:import_file) }

    it "destroys the requested import_file" do
      expect { delete import_file_url(import_file) }.to change(ImportFile, :count).by(-1)
    end

    it "redirects to the import_files list" do
      delete import_file_url(import_file)

      expect(response).to redirect_to(import_files_url)
    end

    it "returns a success message" do
      delete import_file_url(import_file)

      expect(flash[:notice]).to eq("Import file was successfully destroyed.")
    end

    context "when the import file does not exist" do
      it "raises an error" do
        expect { delete import_file_url(0) }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
