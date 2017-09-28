
#AirfareWatchDogScraper.new(http://www.airfarewatchdog.com/top-50-fares/).scrape
#===> returns list of daily deals

# 1. need new AirfareWatchDogScraper class
# 2. class instantiates the list
# 3. scrape details of list
# 4. scrape individual deals from list and add to list

class AirfareWatchDogScraper

  def initialize

    @doc = Nokogiri::HTML(open("http://www.airfarewatchdog.com/top-50-fares/"))

  end


end
