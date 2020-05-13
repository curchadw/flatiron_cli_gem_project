#CLI contorller like in a MVC
require_relative "../minority_biz/scraper.rb"
require_relative '../minority_biz/business.rb'
require 'pry'

class MinorityBiz::CLI
    def call
        puts "Hello and welcome to the SA Minority Business Directory!" 
        
        initial_options
        make_listings
        
        options
        
        
        
    end


    def initial_options
        
      puts  <<-DOC.gsub /^\s+/, ""
            Would you like a listing of current minority owned businesses in San Antonio?

            1. Listings
            2. Exit
              
        DOC
    end

    

    def options
        
        input = ""
        while input != "2"
            
            input = gets.strip.downcase
            
            case input
                when "1"
                    case_one
                   
                when "2"
                    end_message
               
                    
                else 
                
                sleep(1)
                initial_options
                options
                
                end
        end
          
    end

    def case_one
        
        puts 'Type "back" to go back to main menu'
        puts '------------------------------------'
        puts 'Pick a business to get information on'
        puts "Pending list...."
        sleep(1)

        show_listings
        
        
    end

    def make_listings
        Scraper.scrape_first_page
        Scraper.scrape_second_page
        Scraper.scrape_third_page
        Scraper.scrape_fourth_page
    end

    def business_listings
        
        Business.all.each.with_index(1) do |biz,i|
           
            puts "#{i}.#{biz.name}"
            
        end
        
        
    end

    def find_by_index
       user_input = gets.to_i
        biz = Business.all[user_input-1]
              if user_input > 0 && user_input <= Business.all.length()
                puts "Name: #{biz.name}"
                puts "Type: #{biz.type}"
                puts "Phone Number: #{biz.number}"
                puts "Type 'back' to main menu" 
                
               else
                puts "Invalid input"
                sleep(1)  
                show_listings 
               end
    end

    def show_listings
        business_listings
        find_by_index
        
    end

    
    def end_message
        puts 'Have yourself a good day!'  
    end

    
    
end




