require "./spec/spec_helper"

# rubocop:disable Metrics/BlockLength
RSpec.describe Auction do
  before(:each) do
    @auction = Auction.new
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
    it "can list item names" do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expect(@auction.item_names).to eq([
        "Chalkware Piggy Bank",
        "Bamboo Picture Frame"
      ])
    end
  end

  describe "#Bidding - " do
    it "can list unpopular items" do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      expect(@auction.unpopular_items).to eq([@item2, @item3, @item5])
      @item3.add_bid(@attendee2, 15)
      expect(@auction.unpopular_items).to eq([@item2, @item5])
    end
    it "can list bidders' names" do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      expect(@auction.bidders).to eq(%w[Bob Megan Mike])
    end
    it "can edit bidder info" do
      bidder_info = Hash.new({})
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item2.add_bid(@attendee1, 15)
      @auction.edit_bidder_info(bidder_info, @attendee2, @item1)
      expect(bidder_info).to eq({
        @attendee2 => {
          budget: 75,
          items: [@item1]
        }
      })
      @auction.edit_bidder_info(bidder_info, @attendee1, @item1)
      expect(bidder_info).to eq({
        @attendee1 => {
          budget: 50,
          items: [@item1]
        },
        @attendee2 => {
          budget: 75,
          items: [@item1]
        }
      })
      @auction.edit_bidder_info(bidder_info, @attendee1, @item2)
      expect(bidder_info).to eq({
        @attendee1 => {
          budget: 50,
          items: [@item1, @item2]
        },
        @attendee2 => {
          budget: 75,
          items: [@item1]
        }
      })
    end
    it "can list bidder info" do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)
      expect(@auction.bidder_info).to eq({
        @attendee1 => {
          budget: 50,
          items: [@item1]
        },
        @attendee2 => {
          budget: 75,
          items: [@item1, @item3]
        },
        @attendee3 => {
          budget: 100,
          items: [@item4]
        }
      })
    end
  end

  describe "#Revenue - " do
    it "can display potential revenue" do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@atendee2, 15)
      expect(@auction.potential_revenue).to eq(87)
    end
  end
end
# rubocop:enable Metrics/BlockLength
