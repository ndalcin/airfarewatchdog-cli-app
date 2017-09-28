
#AirfareWatchDogScraper.new(http://www.airfarewatchdog.com/top-50-fares/).scrape
#===> returns list of daily deals

# 1. need new AirfareWatchDogScraper class
# 2. class instantiates the list
# 3. scrape details of list
# 4. scrape individual deals from list and add to list

class FlightDealCLI::Scraper

  def get_site_deals
    site = Nokogiri::HTML(open("http://www.airfarewatchdog.com/top-50-fares/"))
    deals = site.css(".col-xs-12 .fare_list")
  end

  def scrape_deals

    alldeals = doc.css(".col-xs-12 .fare_list")

  end




end
