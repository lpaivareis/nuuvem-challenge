require "rails_helper"

RSpec.describe "ImportFiles" do
  before do
    driven_by(:rack_test)
    create(:import_file)
    create(:order)
  end

  describe "visiting the index" do
    it "shows the import files" do
      visit import_files_path

      expect(page).to have_content "Importações"
    end

    it "click to show first order" do
      visit import_files_path

      find("a[class='btn btn-success'][href='#{import_file_path(ImportFile.first)}']").click
      expect(page).to have_current_path(import_file_path(ImportFile.first))
    end

    it "click to destroy first order" do
      visit import_files_path

      find("a[class='btn btn-danger'][data-method='delete'][href='#{import_file_path(ImportFile.first)}']").click
      expect(page).to have_current_path(import_files_path)
    end

    it "click to new import file" do
      visit import_files_path
      find("a[class='btn btn-primary'][href='#{new_import_file_path}']").click
      expect(page).to have_current_path(new_import_file_path)
    end
  end
end
