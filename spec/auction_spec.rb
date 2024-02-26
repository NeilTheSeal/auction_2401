require "./spec/spec_helper"

RSpec.describe Auction do
  before(:each) do
    @auction = Auction.new
    @item1 = Item.new("Chalkware Piggy Bank")
    @item2 = Item.new("Bamboo Picture Frame")
  end

  describe "#Initialization - " do
    it "exists" do
      expect(@auction).to be_an_instance_of(Auction)
    end
    it "has attributes" do
      expect(@auction.items).to eq([])
    end
  end

  describe "#Adding items - " do
    it "can add items" do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expect(@auction.items).to eq([@item1, @item2])
    end
  end
end
