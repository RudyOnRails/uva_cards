puts "How many cards are you using?"

@number_of_cards = gets.to_i

@array_of_cards = (1..@number_of_cards).to_a

if @number_of_cards.even?
  if (@number_of_cards/2).odd? # numbers like 10, 14, etc.
    @column1 = @array_of_cards.shift(@number_of_cards/2)
  
    @column3 = @array_of_cards.pop(@number_of_cards/4)
    storage = @column3[-1]
    @column3[-1] = @column3[-2]
    @column3[-2] = storage
  
    @column2 = @array_of_cards
  else
    @column1 = @array_of_cards.shift(@number_of_cards/2)
  
    @column3 = @array_of_cards.pop(@number_of_cards/4)
    storage = @column3[-1]
    @column3[-1] = @column3[-2]
    @column3[-2] = storage
  
    @column2 = @array_of_cards
  end
else
  @column1 = @array_of_cards.shift(@number_of_cards/2 + 1)
  @column3 = @array_of_cards.shift(@number_of_cards/2 / 2)
  @column2 = @array_of_cards
  storage = @column2[-1]
  @column2[-1] = @column2[-2]
  @column2[-2] = storage
end

@final_order = [ ]

def final_array_is_not_full
  @final_order.count != @number_of_cards
end

while final_array_is_not_full do
  @final_order << @column1.shift
  @final_order << @column2.shift
  @final_order << @column1.shift
  @final_order << @column3.shift
  @final_order.compact!
end

# puts @column1.inspect
# puts @column2.inspect
# puts @column3.inspect
puts @final_order.inspect

