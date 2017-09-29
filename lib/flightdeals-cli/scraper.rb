
#AirfareWatchDogScraper.new(http://www.airfarewatchdog.com/top-50-fares/).scrape
#===> returns list of daily deals

# 1. need new FlightDealScraper class
# 2. scrape details of list
# 3. scrape individual deals from list and add to list

class Scraper

  def get_page
    Nokogiri::HTML(open("http://www.airfarewatchdog.com/top-50-fares/"))
  end

  def scrape_list_page
    self.get_page.css(".col-xs-12 .fare_list a")
  end

  def make_deal
    scrape_list_page.each do |deal|
      Deal.new_from_deal_page(deal)
    end
  end

  

#   def scrape_single_deal
#     Deal.all.each do |deal|
#     more_details = Scraper.scrape_deal_page(BASE_PATH + student.profile_url)
#     student.add_student_attributes(attributes)
#   end
# end

  # def make_details
  #   scrape_deal_page.each do |a|
  #
  #     d = Deal.new
  #     a.each do |details|
  #       details.css(".fare-details .fare-details__pair_container")
  #       if
  #
  #



end
