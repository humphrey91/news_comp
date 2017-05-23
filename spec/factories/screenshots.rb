FactoryGirl.define do
  factory :screenshot, class: Screenshot do
    filename { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'screenshots', 'cnn.png')) }
    domain_id 1
  end
end
