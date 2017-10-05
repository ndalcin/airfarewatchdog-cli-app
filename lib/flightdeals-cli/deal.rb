class FlightDealCLI::Deal

  attr_accessor :page, :rt, :price, :departure, :arrival, :link, :label_1, :label_2, :label_3, :label_4, :label_5, :label_6, :value_1, :value_2, :value_3, :value_4, :value_5, :value_6

  @@all = []

  def initialize(rt, price, departure, arrival, link)
    @rt = rt
    @price = price
    @departure = departure
    @arrival = arrival
    @link = link
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(input)
    self.all[input-1]
  end

  def self.price_under(num)
    #returns an array of all the deals that are priced below the num passed in
    under_num_array = []
    self.all.each do |deal|
      if deal.price.delete('$').to_i < num
      under_num_array << deal
      end
    end
    under_num_array
  end

end
