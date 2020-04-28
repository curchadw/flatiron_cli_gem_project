require 'nokogiri'
require 'open-uri'
require 'pry'


class Scraper
    def self.scrape_main_page
        
        html = open("https://www.texasblackpages.com/united-states/san-antonio")
        doc = Nokogiri::HTML(html)
        listings = doc.css('div.mid_section')
        invid_biz = doc.css('a .h3 b')
       list =  invid_biz.each do |biz|
            puts '#{biz}'
        end
        

        binding.pry
    end





end

Scraper.scrape_main_page



#doc.css('div.mid_section').text
#doc.css(a .h3 b)