require "./spec/spec_helper"

RSpec.describe Attendee do
  before(:each) do
    @attendee = Attendee.new({ name: "Megan", budget: "$50" })
  end

  describe "#Initialization - " do
    it "exists" do
      expect(@attendee).to be_an_instance_of(Attendee)
    end
  end
end
