
#AirfareWatchDogScraper.new(http://www.airfarewatchdog.com/top-50-fares/).scrape
#===> returns list of daily deals

# 1. need new FlightDealScraper class
# 2. scrape details of list
# 3. scrape individual deals from list and add to list

class Scraper

  attr_accessor :doc, :links



  def initialize
    @doc = Nokogiri::HTML(open("http://www.airfarewatchdog.com/top-50-fares/"))
    @links = []
  end


  def scrape_deals
    @doc.css(".col-xs-12 .fare_list a")
  end

  def make_deal
    scrape_deals.each do |d|
      new_deal = Deal.new
      new_deal.price = d.css(".fare_price_text").text
      new_deal.departure = d.css(".fare_departure").text.strip.gsub!( /\s+/, ' ').delete "\n"
      new_deal.arrival = d.css(".fare_arrival").text.strip.gsub!( /\s+/, ' ').delete "\n"
      half_link = d.attr("href")
      links << new_deal.link = "http://www.airfarewatchdog.com/" + half_link
    end
  end

  def make_deal_details
    real_links.each do {|link| Nokogiri::HTML(open("link"))}
  end





end
