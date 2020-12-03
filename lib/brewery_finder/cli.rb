class Cli
    
    def start
        puts "Lets find a brewery!"
        puts "...Loading..."
        puts ""
        Api.get_data
        main_menu_options
    end

    def main_menu_options
        puts "Type '1' to find a brewery"
        puts "Type 'exit' to exit the program"
        main_menu
    end

    def main_menu
        input = get_input

        if input == "1"
            puts ""
            puts "  ~~Brewery List~~"
            list_breweries
            select_brewery_options
        elsif input == "exit"
            puts "Goodbye!"
        else 
            invalid_selection
            main_menu_options
        end
    end

    def get_input
        print "Enter Your Selection: "
        gets.chomp
    end

    def invalid_selection
        puts "Invalid Selection."
    end

    def list_breweries
        BreweryFinder.all.each.with_index(1) do |data, index|
            puts "#{index}. #{data.name}"
     end
    end

    def select_brewery_options
        puts ""
        puts "Enter the number of the brewery you would like to locate."
        puts "Please enter a number between '1' and '20' or 'exit' to exit the program."
        brewery_details
    end

    def brewery_details
        input = get_input

        if input.to_i.between?(1, BreweryFinder.all.length)
            index = input.to_i - 1
            brewery = BreweryFinder.all[index]
            show_brewery_details(brewery)
        elsif input == "exit"
            puts "Sorry to see you go."
        else 
            invalid_selection
            select_brewery_options
        end
    end

    def show_brewery_details(brewery)
        puts ""
        puts "#{brewery.name}"
        puts "#{brewery.street}"
        puts "#{brewery.city}"
        puts "#{brewery.state}"
        puts "#{brewery.website_url}"
        puts ""
        find_another_brewery
    end

    def find_another_brewery
        puts "Would you like to find another brewery?"
        puts "Enter 'y' if yes.  Enter 'exit' to exit the program."
        input = get_input
        
        if input == 'y'
            puts "  ~~Brewery List~~"
            list_breweries
            select_brewery_options
        elsif input == 'exit'
            puts "  Cheers!"
            puts "Drink Good Beer!"
        else
            invalid_selection
            find_another_brewery
        end
    end
end