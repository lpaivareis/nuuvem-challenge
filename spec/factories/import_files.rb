FactoryBot.define do
  factory :import_file do
    file { Rack::Test::UploadedFile.new(Rails.root.join("spec", "fixtures", "files", "example_input.tab"), "text/tab-separated-values") }

    total_amount { 95.00 }
  end
end
