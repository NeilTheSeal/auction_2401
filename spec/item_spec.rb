require "./spec/spec_helper"

RSpec.describe Item do
  before(:each) do
    @item1 = Item.new("Chalkware Piggy Bank")
    @item2 = Item.new("Bamboo Picture Frame")
  end

  describe "#Initialization - " do
    it "exists" do
      expect(@item1).to be_an_instance_of(Item)
    end
  end
end
