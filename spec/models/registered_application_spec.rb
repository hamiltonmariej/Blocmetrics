require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do

  describe "User with registered application" do
    it "should build a new user with registered application" do
      @user = FactoryGirl.build(:user)
      @user.save
    end
  end

  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to validate_presence_of(:user_id) }

  describe "attributes" do
  let(:registered_application) { create(:registered_application) }  

    it "responds to name" do
      expect(registered_application).to respond_to(:name)
    end

    it "responds to url" do
      expect(registered_application).to respond_to(:url)
    end
  end
end
