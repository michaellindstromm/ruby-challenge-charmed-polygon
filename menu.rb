require_relative './charmed_polygon.rb'

def start_menu
   puts "Please enter any positive odd number!"
   puts
   input = gets.chomp.to_i
   puts
    if input % 2 == 0 or input < 1
        puts "That is not a positive odd number dude."
        puts
        start_menu
    else
        CharmedPolygon.new.create_polygon(input)
    end
end

start_menu
