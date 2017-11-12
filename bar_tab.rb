class BarTab

  attr_accessor :drinks, :tab

  def initialize
    @drinks = {"beer" => 4, "wine" => 5, "fizz" => 6, "coke" => 2}
    @tab = 0
  end

  def show_drinks_list
    @drinks.each { |drink, cost| puts "#{drink} : #{cost}"}
  end

  def take_fee(fee)
    @tab += fee
  end

  def sell_drink(choice, guest)
    @drinks.each do |type, cost|
      if type == choice
        guest.buy_drink(cost)
        @tab += cost
      end
    end
  end

end
