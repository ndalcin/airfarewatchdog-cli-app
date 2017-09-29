class Deal

  attr_accessor :page, :price, :departure, :arrival, :link, :airline, :advanced_purchase, :availabledays, :startingon, :endingon, :requiremnets, :url

  @@all = []

  def self.new_from_deal_page(deal)
    self.new(
      deal.css(".fare_price_text").text,
      deal.css(".fare_departure").text.strip.gsub!( /\s+/, ' ').delete("\n"),
      deal.css(".fare_arrival").text.strip.gsub!( /\s+/, ' ').delete("\n"),
      "http://www.airfarewatchdog.com#{deal.attr("href")}"
    )
  end

  def initialize(price, departure, arrival, link)
    @price = price
    @departure = departure
    @arrival = arrival
    @link = link
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(num)
    self.all[num-1]
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

  def find_more_details
  end

  def page
    @page = Nokogiri::HTML(open(self.link))
  end





end
