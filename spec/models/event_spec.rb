require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:registered_application) { create(:registered_application) }
  let(:event) { create(:event, registered_application: registered_application) }

  describe "attributes" do
    it "responds to name" do
      expect(event).to respond_to(:name)
    end
  end
end
