
#AirfareWatchDogScraper.new(http://www.airfarewatchdog.com/top-50-fares/).scrape
#===> returns list of daily deals

# 1. need new FlightDealScraper class
# 2. scrape details of list
# 3. scrape individual deals from list and add to list

class FlightDealCLI::Scraper


  def get_page
    Nokogiri::HTML(open("http://www.airfarewatchdog.com/top-50-fares/"))
  end

  def scrape_deals
    self.get_page.css(".col-xs-12 .fare_list .fare_row")
  end

  def make_deal
    scrape_deals.each do |deal|
    end
  end


end
