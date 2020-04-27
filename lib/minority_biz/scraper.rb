require 'nokogiri'
require 'open-uri'
require 'pry'


class Scraper
    def self.scrape_main_page
        doc = Nokogiri::HTML(open('https://www.texasblackpages.com/united-states/san-antonio'))
        binding.pry
    end





end