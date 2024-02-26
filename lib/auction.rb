require "./lib/item"
require "./lib/attendee"

class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    names = []
    @items.each do |item|
      names << item.name
    end
    names
  end

  def unpopular_items
    @items.select do |item|
      item.bids.empty?
    end
  end

  def potential_revenue
    revenue = 0.0
    @items.each do |item|
      revenue += item.current_high_bid
    end
    revenue
  end
end
