require "rails_helper"
require "application_helper"

RSpec.describe "import_files/index" do
  before do
    assign(:import_files, [
             create(:import_file)
           ])
  end

  it "render a order list table" do
    render
    expect(rendered).to have_table(class: "table table-striped")
  end

  it "render a page title" do
    render
    expect(rendered).to have_selector("h1", text: "Importações")
  end

  it "render a table with the correct headers" do
    render
    expect(rendered).to have_selector("table thead tr th", text: "ID")
    expect(rendered).to have_selector("table thead tr th", text: "Descrição")
  end

  it "render a table with the correct rows" do
    render
    expect(rendered).to have_selector("table tbody tr td", text: ImportFile.first.id)
    expect(rendered).to have_selector("table tbody tr td", text: import_title(ImportFile.first))
  end

  it "render a link to import new file" do
    render
    expect(rendered).to have_link("Nova Importação", href: new_import_file_path)
  end

  it "render a link to destroy the import file" do
    render
    expect(rendered).to have_selector("a[class='btn btn-danger'][href='#{import_file_path(ImportFile.first)}']")
  end

  it "render a link to show the import file" do
    render
    expect(rendered).to have_link(href: import_file_path(ImportFile.first))
  end
end
