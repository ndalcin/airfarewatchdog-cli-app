class FlightDealCLI::Deal

  attr_accessor :price, :departure, :arrival, :link, :airline, :availabledays, :startingon, :endingon, :url

  @@all = []

  def initialize(price, departure, arrival, link)
    @price= price
    @departure = departure
    @arrival= arrival
    @link= link
    @@all << self
  end

  def airline

  end

  def availabledays

  end

  def startingon

  end

  def endingon

  end

  def url

  end





end
