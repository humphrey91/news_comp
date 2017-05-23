require 'rails_helper'

RSpec.describe Domain, type: :model do

  it "creates new domain" do
    create(:domain)
    expect(Domain.all.count).to eq 1
  end

end
