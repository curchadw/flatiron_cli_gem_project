#CLI contorller like in a MVC
class MinorityBiz::CLI
    def call
        puts "Hello and welcome to the SA Black Minority Business Directory!" 
        initial_options
        options
        end_message
    end


    def initial_options
        
      puts  <<-DOC.gsub /^\s+/, ""
            Would you like a listing of current black owned businesses in San Antonio?

            1. First Page
            2. Second Page
            3. Third Page
            4. Forth Page
            5. Exit  
        DOC
    end

    def options
        puts"Please choose an option"
        input = ""
        while input != "5"
            input = gets.strip.downcase
            case input
                when "1"
                    get_page
                when "2"
                    listings
                when "3"
                    listings
                when "4"
                    listings
                when "5"
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

    def listings
        puts "listings will appear here once I write of file for it"
    end

    def end_message
        puts 'Have yourself a good day!'
    end

    def get_page
        @first_page = FirstPage.all
    end
    
end