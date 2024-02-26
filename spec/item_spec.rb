require "./spec/spec_helper"

# rubocop:disable Metrics/BlockLength
RSpec.describe Item do
  before(:each) do
    @item1 = Item.new("Chalkware Piggy Bank")
    @item2 = Item.new("Bamboo Picture Frame")
    @item3 = Item.new("Homemade Chocolate Chip Cookies")
    @item4 = Item.new("2 Days Dogsitting")
    @item5 = Item.new("Forever Stamps")
    @attendee1 = Attendee.new({ name: "Megan", budget: "$50" })
    @attendee2 = Attendee.new({ name: "Bob", budget: "$75" })
    @attendee3 = Attendee.new({ name: "Mike", budget: "$100" })
  end

  describe "#Initialization - " do
    it "exists" do
      expect(@item1).to be_an_instance_of(Item)
    end
    it "has attributes" do
      expect(@item1.name).to eq("Chalkware Piggy Bank")
      expect(@item2.name).to eq("Bamboo Picture Frame")
    end
  end

  describe "#Bidding - " do
    it "can be bidded on" do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expect(@item1.bids).to eq({
        @attendee1 => 22,
        @attendee2 => 20
      })
    end
    it "can list the highest bid" do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expect(@item1.current_high_bid).to eq(22)
    end
    it "can close bidding on that item" do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      bid_close = @item1.close_bidding
      expect(bid_close).to eq(true)
      @item1.add_bid(@attendee3, 50)
      expect(@item1.bids).to eq({
        @attendee1 => 22,
        @attendee2 => 20
      })
    end
  end
end
# rubocop:enable Metrics/BlockLength
