
#AirfareWatchDogScraper.new(http://www.airfarewatchdog.com/top-50-fares/).scrape
#===> returns list of daily deals

# 1. need new FlightDealScraper class
# 2. scrape details of list
# 3. scrape individual deals from list and add to list

class Scraper

  attr_accessor :doc

  def initialize
    @doc = Nokogiri::HTML(open("http://www.airfarewatchdog.com/top-50-fares/"))
  end

  def scrape_deals
    @doc.css(".col-xs-12 .fare_list a")
  end

  def make_deal
    scrape_deals.each do |d|
      binding.pry
      new_deal = Deal.new
      new_deal.price = d.css(".fare_price_text").text
      new_deal.departure = d.css(".fare_departure").text.strip.delete "\n"
      new_deal.arrival = d.css(".fare_arrival").text.strip.delete "\n"
      new_deal.link = d.attr("href")
    end
  end


end
