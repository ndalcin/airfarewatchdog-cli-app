class FlightDealCLI::CLI

  def call
    FlightDealCLI::Scraper.new.make_deal
    puts "---Welcome to Daily Flight Deals---"
    puts ""
    puts "Let me find today's best 50 deals.."
    puts "-----------------------------------"
    sleep(3)
    start
  end

  def start

    print_deals_list

    puts ""
    puts "What deal would you like more information on? Please type a number:"
    input = gets.strip.to_i

    print_one_deal(input)

  end



  def print_deals_list
    puts ""
    FlightDealCLI::Deal.all.each_with_index do |deal,index|
      puts "#{index+1}. #{deal.departure} - #{deal.arrival} for #{deal.price}"
    end
  end

  def print_one_deal(input)


  end




end
