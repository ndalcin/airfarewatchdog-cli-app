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

  def self.find(input)
    self.all[input-1]
  end

  def page
    @page = Nokogiri::HTML(open(self.link))
  end

  def label_1 #always 'Airlines'
    if page.css(".fare-details .fare-details__pair_container .fare-details__key")[0] != nil
      @label_1= page.css(".fare-details .fare-details__pair_container .fare-details__key")[0].text
    end
  end

  def value_1
    if page.css(".fare-details .fare-details__pair_container .fare-details__val")[0] != nil
      @value_1 = page.css(".fare-details .fare-details__pair_container .fare-details__val")[0].text
    end
  end

  def label_2
    if page.css(".fare-details .fare-details__pair_container .fare-details__key")[1] != nil
      @label_2 ||= page.css(".fare-details .fare-details__pair_container .fare-details__key")[1].text
    end
  end

  def value_2
    if page.css(".fare-details .fare-details__pair_container .fare-details__val")[1] != nil
      @value_2 ||= page.css(".fare-details .fare-details__pair_container .fare-details__val")[1].text
    end
  end

  def label_3
    if page.css(".fare-details .fare-details__pair_container .fare-details__key")[2] != nil
      @label_3 ||= page.css(".fare-details .fare-details__pair_container .fare-details__key")[2].text
    end
  end

  def value_3
    if page.css(".fare-details .fare-details__pair_container .fare-details__val")[2] != nil
      @value_3 ||= page.css(".fare-details .fare-details__pair_container .fare-details__val")[2].text
    end
  end

  def label_4 #only a few won't have this
    if page.css(".fare-details").css("li").length == 8 || page.css(".fare-details").css("li").length == 10
      @label_4 ||= page.css(".fare-details .fare-details__pair_container .fare-details__key")[3].text
    end
  end

  def value_4 #only a few won't have this
    if page.css(".fare-details").css("li").length == 8 || page.css(".fare-details").css("li").length == 10
      @value_4 ||= page.css(".fare-details .fare-details__pair_container .fare-details__val")[3].text
    end
  end

  def label_5 #only some will have this
    if page.css(".fare-details").css("li").length == 10
      @label_5 ||= page.css(".fare-details .fare-details__pair_container .fare-details__key")[4].text
    end
  end

  def value_5 #only some will have this
    if page.css(".fare-details").css("li").length == 10
      @value_5 ||= page.css(".fare-details .fare-details__pair_container .fare-details__val")[4].text
    end
  end

  def label_6 #probably extra, but just incase!
    if page.css(".fare-details").css("li").length > 10
      @label_6 ||= page.css(".fare-details .fare-details__pair_container .fare-details__key")[5].text
    end
  end

  def label_6 #probably extra, but just incase!
    if page.css(".fare-details").css("li").length > 10
      @value_6 ||= page.css(".fare-details .fare-details__pair_container .fare-details__val")[5].text
    end
  end




end
