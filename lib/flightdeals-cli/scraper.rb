
#AirfareWatchDogScraper.new(http://www.airfarewatchdog.com/top-50-fares/).scrape
#===> returns list of daily deals


class FlightDealCLI::Scraper

  def get_page
    Nokogiri::HTML(open("http://www.airfarewatchdog.com/top-50-fares/"))
  end

  def scrape_list_page
    self.get_page.css(".col-xs-12 .fare_list a")
  end

  def make_deal
    scrape_list_page.each do |deal|
      FlightDealCLI::Deal.new_from_deal_page(deal)
    end
  end

end
