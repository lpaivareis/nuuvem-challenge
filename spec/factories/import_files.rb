FactoryBot.define do
  factory :import_file do
    file do
      Rack::Test::UploadedFile.new(Rails.root.join("spec", "fixtures", "files", "example_input.tab"),
                                   "text/tab-separated-values")
    end

    total_amount { 95.00 }
  end
end
