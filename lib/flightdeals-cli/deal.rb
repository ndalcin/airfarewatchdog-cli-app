class Deal

  attr_accessor :price, :departure, :arrival, :link, :airline, :availabledays, :startingon, :endingon, :url

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def airline

  end

  def availabledays

  end

  def startingon

  end

  def endingon

  end

  def url

  end





end
