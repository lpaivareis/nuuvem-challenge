require "rails_helper"

RSpec.describe "import_files/show" do
  before do
    orders

    assign(:import_file, [
            create(:import_file, orders: [ create_list(:order, 3)])
          ])
  end

  it "renders a table" do
    render

    expect(rendered).to have_selector("table")
  end

  it "renders a linnk to back to index" do
    render

    expect(rendered).to have_link("Back", href: import_files_path)
  end
end
