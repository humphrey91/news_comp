require 'rails_helper'

RSpec.describe Screenshot, type: :model do

  it "creates new domain" do
    create(:domain)
    create(:screenshot)
    expect(Screenshot.all.count).to eq 1
    expect(Domain.first.screenshots.count).to eq 1
    expect(Screenshot.first.domain.host).to eq 'cnn.com'
  end

end
