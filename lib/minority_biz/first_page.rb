class FirstPage
    

    @@all = []

    def initialize
        @first_page_instance = Scraper.new
        
    end

    def self.display_page
        @first_page_instance.scraper_first_page
    end

    def self.all
        @@all
    end
end