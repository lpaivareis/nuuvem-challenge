FactoryBot.define do
  factory :import_file do
    file do
      Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/files/example_input.tab"),
                                   "text/tab-separated-values")
    end

    trait :with_error do
      file do
        Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/files/empty_file.tab"),
                                     "text/tab-separated-values")
      end
    end
  end
end
