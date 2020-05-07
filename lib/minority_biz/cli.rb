#CLI contorller like in a MVC
require_relative "../minority_biz/scraper.rb"
require_relative '../minority_biz/business.rb'
require 'pry'

class MinorityBiz::CLI
    def call
        puts "Hello and welcome to the SA Black Minority Business Directory!" 
        
        initial_options
        options
        
        
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
                    puts 'Type "back" to go back to main menu'
                    puts '------------------------------------'
                    puts 'Pick a business to get information on'
                    show_listings
                    
                    puts 'Type "back" to go back to main menu'
                    puts '------------------------------------'
                when "2"
                    puts 'Have yourself a good day!'
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
        Scraper.scrape_first_page
        Scraper.scrape_second_page
        Scraper.scrape_third_page
        Scraper.scrape_fourth_page
        
        business_array = Scraper.business_listings
        
        # Business.create_from_collection(business_array)
    end

    def show_listings
        make_listings
        Scraper.find_by_index
        
    end

    def end_message
        puts 'Have yourself a good day!'  
    end

    
    
end




