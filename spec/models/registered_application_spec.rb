require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do
  let(:registered_application) { RegisteredApplication.create!(name: "My Test Application", url: "http://www.testapp.com") }

  describe "attributes" do
    it "responds to name" do
      expect(registered_application).to respond_to(:name)
    end

    it "responds to url" do
      expect(registered_application).to respond_to(:url)
    end
  end
end
