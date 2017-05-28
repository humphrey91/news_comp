# spec/support/factory_girl.rb
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  def submit_form

    within 'commit' do
      find("option[value='Submit']").click
    end
  end
end
