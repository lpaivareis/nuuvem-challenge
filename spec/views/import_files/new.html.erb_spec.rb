require "rails_helper"

RSpec.describe "import_files/new" do
  before do
    assign(:import_file, ImportFile.new)
  end

  it "render a form to import a new file" do
    render
    expect(rendered).to have_selector("form")
  end

  it "render a page title" do
    render
    expect(rendered).to have_selector("h3", text: "Importação")
  end

  it "render a link to save import file" do
    render
    expect(rendered).to have_selector("input[type='submit'][value='Salvar']")
  end

  it "render a link to back to index" do
    render
    expect(rendered).to have_link("Voltar", href: import_files_path)
  end
end
