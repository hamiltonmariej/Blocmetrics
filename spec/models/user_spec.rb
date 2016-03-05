require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  it { is_expected.to have_many(:registered_applications) }


  describe "attributes do"

    it "responds to role" do
      expect(user).to respond_to(:role)
    end
  end

  describe "roles" do
  let(:user) { create(:user, role: "standard") }
  let(:admin_user) { create(:user, role: "admin") }

  it "is standard by default" do
    expect(user.role).to eql("standard")
  end

  it "equals admin for role" do
    expect(admin_user.role).to eql("admin")
  end
end
