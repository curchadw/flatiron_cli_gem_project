#CLI contorller like in a MVC
require "./lib/minority_biz/scraper.rb"

class MinorityBiz::CLI
    def call
        puts "Hello and welcome to the SA Black Minority Business Directory!" 
        
        initial_options
        options
        make_listings
        end_message
    end


    def initial_options
        
      puts  <<-DOC.gsub /^\s+/, ""
            Would you like a listing of current black owned businesses in San Antonio?

            1. Listings
            2. Exit
              
        DOC
    end

    def options
        puts"Please choose an option"
        input = ""
        while input != "2"
            input = gets.strip.downcase
            case input
                when "1"
                    show_listings
                    
                when "2"
                    end_message
                when 'back'
                    initial_options
                else 
                puts "Invalid entry, please try again"
                sleep(2)
                initial_options
                options
                end
          end
            
    end

    def make_listings
        business_arrays = Scraper.business_listings
        Business.create_from_collection(business_arrays)
    end

    def show_listings
        Business.all.each do |biz|
            puts "Name: #{biz.name}"
            puts "Type of Business: #{biz.type}"
            puts "Phone Number: #{biz.number}"
        end
    end

    def end_message
        puts 'Have yourself a good day!'
    end

    
    
end