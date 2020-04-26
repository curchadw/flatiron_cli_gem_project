#CLI contorller like in a MVC
class MinorityBiz::CLI
    def call
        puts "Hello and welcome to the SA Black Minority Business Directory!" 
        list_options
        options
    end


    def list_options
        
      puts  <<-DOC.gsub /^\s+/, ""
            Would you like a listing of current black owned businesses in San Antonio?

            1. Yes
            2. Exit  
        DOC
    end

    def options
        puts"Please choose an option"
        input = gets.strip
        case input
            when "1"
              puts "Making sure 1 works"
            when "2"
              puts "Making sure 2 works"
            #   break
            else 
               puts "Invalid entry, please try again"
               sleep(2)
               list_options
               options
            end
            
    end
end