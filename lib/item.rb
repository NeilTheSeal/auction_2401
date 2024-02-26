class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
    @closed = false
  end

  def add_bid(attendee, bid)
    @bids[attendee] = bid unless @closed
  end

  def current_high_bid
    @bids.values.max || 0
  end

  def close_bidding
    if !@closed
      @closed = true
    else
      false
    end
  end
end
