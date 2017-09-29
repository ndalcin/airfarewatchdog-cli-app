class FlightDealCLI::Deal

  attr_accessor :page, :price, :departure, :arrival, :link, :label_1, :label_2, :label_3, :label_4, :label_5, :label_6, :value_1, :value_2, :value_3, :value_4, :value_5, :value_6

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

  def page
    @page = Nokogiri::HTML(open(self.link))
  end

  def travel_condition_1 #always 'Airlines'
    if page.css(".fare-details .fare-details__pair_container .fare-details__key")[0].text.!empty?
      @label_1 ||= page.css(".fare-details .fare-details__pair_container .fare-details__key")[0].text
      @value_1 ||= page.css(".fare-details .fare-details__pair_container .fare-details__val")[0].text
    end
  end

  def travel_condition_2
    if page.css(".fare-details .fare-details__pair_container .fare-details__key")[1].text.!empty?
      @label_2 ||= page.css(".fare-details .fare-details__pair_container .fare-details__key")[1].text
      @value_2 ||= page.css(".fare-details .fare-details__pair_container .fare-details__val")[1].text
    end
  end

  def travel_condition_3
    if page.css(".fare-details .fare-details__pair_container .fare-details__key")[2].text.!empty?
      @label_3 ||= page.css(".fare-details .fare-details__pair_container .fare-details__key")[2].text
      @value_3 ||= page.css(".fare-details .fare-details__pair_container .fare-details__val")[2].text
    end
  end

  def travel_condition_4 #only a few won't have this
    if page.css(".fare-details .fare-details__pair_container .fare-details__key")[3].text.!empty?
      @label_4 ||= page.css(".fare-details .fare-details__pair_container .fare-details__key")[3].text
      @value_4 ||= page.css(".fare-details .fare-details__pair_container .fare-details__val")[3].text
    end
  end

  def travel_condition_5 #only some will have this
    if page.css(".fare-details .fare-details__pair_container .fare-details__key")[4].text.!empty?
      @label_5 ||= page.css(".fare-details .fare-details__pair_container .fare-details__key")[4].text
      @value_5 ||= page.css(".fare-details .fare-details__pair_container .fare-details__val")[4].text
    end
  end

  def travel_condition_6 #probably extra, but just incase!
    if page.css(".fare-details .fare-details__pair_container .fare-details__key")[5].text.!empty?
      @label_6 ||= page.css(".fare-details .fare-details__pair_container .fare-details__key")[5].text
      @value_6 ||= page.css(".fare-details .fare-details__pair_container .fare-details__val")[5].text
    end
  end




end
