require_relative './charmed_polygon.rb'

def start_menu
   puts "Enter any number to build your charmed polygon!"
   puts ".... except the number 2!"
   puts
   input = gets.chomp.to_i
   puts
    if input == 2
        puts "I told you not to enter that number!!!!!!"
    elsif input % 4 == 0 
        CharmedPolygon.new.mult_four_polygon(input)
    elsif input % 2 == 0
        CharmedPolygon.new.mult_two_polygon(input)
    else
        CharmedPolygon.new.odd_polygon(input, nil)
    end
end

start_menu
