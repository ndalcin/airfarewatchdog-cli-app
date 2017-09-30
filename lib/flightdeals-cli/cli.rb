class FlightDealCLI::CLI

  def call
    start
    deals
    again
    goodbye
  end

  def start
    puts "** Welcome to AirfareWatchDog's Flight Deals **"
    FlightDealCLI::Scraper.new.make_deal
    puts ""
    puts "Let me find today's best deals! One moment please.."
    puts "---------------------------------------------------"
    sleep(3)
  end

  def deals
    print_deals_list

    puts ""
    puts "Which deal would you like more information on? Please type a number:"

    input = gets.strip.to_i

    choice = FlightDealCLI::Deal.find(input)
    print_one_deal(choice)
  end

  def again
    input = nil
    while input != 'exit'
      puts ""
      puts "Would you like to check out another flight deal? Please type 'yes' or 'no':"

      input = gets.strip.downcase

      case input
      when 'yes'
        deals
      when 'no'
        goodbye
      else
        puts "Invalid entry. Please enter 'yes' or 'no':"
      end
    end
  end

  def goodbye
    puts ""
    puts "***Thanks for coming! Come back tomorrow for more great flight deals!***"
    exit
  end

  def print_deals_list
    puts ""
    FlightDealCLI::Deal.all.each_with_index do |deal,index|
      puts "#{index+1}. #{deal.departure} - #{deal.arrival} for #{deal.price} #{deal.rt}"
    end
  end

  def print_one_deal(choice)
    puts ""
    puts "********#{choice.departure} ---> #{choice.arrival}********"
    puts ""
    puts "Price:    #{choice.price} #{choice.rt}"
    puts "#{choice.label_1}:    #{choice.value_1}"
    puts "#{choice.label_2}:    #{choice.value_2}"
    puts "#{choice.label_3}:    #{choice.value_3}"
    puts "#{choice.label_4}:    #{choice.value_4}" if choice.label_4 && choice.value_4 != nil
    puts "#{choice.label_5}:    #{choice.value_5}" if choice.label_5 && choice.value_5 != nil
    puts "#{choice.label_6}:    #{choice.value_6}" if choice.label_6 && choice.value_6 != nil
    puts ""
    puts "For more information on this deal: #{choice.link}"
  end

end
