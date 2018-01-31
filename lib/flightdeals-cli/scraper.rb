
#AirfareWatchDogScraper.new(http://www.airfarewatchdog.com/top-50-fares/).scrape
#===> returns list of daily deals


class FlightDealCLI::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.airfarewatchdog.com/top-50-fares/"))
  end

  def scrape_list_page
    self.get_page.css(".col-xs-12 .fare_list a")
  end

  def make_deal
    scrape_list_page.each do |deal|
      FlightDealCLI::Deal.new(
        deal.css(".fare_rt_text").text,
        deal.css(".fare_price_text").text,
        deal.css(".fare_departure").text.strip.gsub!( /\s+/, ' ').delete("\n"),
        deal.css(".fare_arrival").text.strip.gsub!( /\s+/, ' ').delete("\n"),
        "http://www.airfarewatchdog.com#{deal.attr("href")}"
      )
    end
  end

  def self.scrape_additional_details(deal)
    page = Nokogiri::HTML(open(deal.link))

    if page.css(".fare-details .fare-details__pair_container .fare-details__key")[0] != nil
      deal.label_1 = page.css(".fare-details .fare-details__pair_container .fare-details__key")[0].text
      deal.value_1 = page.css(".fare-details .fare-details__pair_container .fare-details__val")[0].text
    end

    if page.css(".fare-details .fare-details__pair_container .fare-details__key")[1] != nil
      deal.label_2 ||= page.css(".fare-details .fare-details__pair_container .fare-details__key")[1].text
      deal.value_2 ||= page.css(".fare-details .fare-details__pair_container .fare-details__val")[1].text
    end

    if page.css(".fare-details .fare-details__pair_container .fare-details__key")[2] != nil
      deal.label_3 ||= page.css(".fare-details .fare-details__pair_container .fare-details__key")[2].text
      deal.value_3 ||= page.css(".fare-details .fare-details__pair_container .fare-details__val")[2].text
    end

    if page.css(".fare-details").css("li").length == 8 || page.css(".fare-details").css("li").length == 10
      deal.label_4 ||= page.css(".fare-details .fare-details__pair_container .fare-details__key")[3].text
      deal.value_4 ||= page.css(".fare-details .fare-details__pair_container .fare-details__val")[3].text
    end

    if page.css(".fare-details").css("li").length == 10
      deal.label_5 ||= page.css(".fare-details .fare-details__pair_container .fare-details__key")[4].text
      deal.value_5 ||= page.css(".fare-details .fare-details__pair_container .fare-details__val")[4].text
    end

    if page.css(".fare-details").css("li").length > 10
      deal.label_6 ||= page.css(".fare-details .fare-details__pair_container .fare-details__key")[5].text
      deal.value_6 ||= page.css(".fare-details .fare-details__pair_container .fare-details__val")[5].text
    end

  end

end
