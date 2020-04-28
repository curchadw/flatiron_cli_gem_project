require 'nokogiri'
require 'open-uri'
require 'pry'


class Scraper
    
    def self.scrape_listings
        local_biz - Array.new
        local_biz << self.scrape_main_page
        local_biz

    end 
    
    
    def self.scrape_first_page
        
        html = open("https://www.texasblackpages.com/united-states/san-antonio")
        doc = Nokogiri::HTML(html)
        biz_name = doc.css('h2.h3 b').text
        type_biz = doc.css('h2.h3 span').text
        biz_number = doc.css('span.sm-block.lmargin.sm-nomargin').text
    end

    def self.scrape_second_page
        html = open('https://www.texasblackpages.com/united-states/san-antonio?page=2')
        doc = Nokogiri::HTML(html)
        biz_name = doc.css('h2.h3 b').text
        type_biz = doc.css('h2.h3 span').text
        biz_number = doc.css('span.sm-block.lmargin.sm-nomargin').text
        binding.pry
    end


    def self.scrape_third_page
        html = open('https://www.texasblackpages.com/united-states/san-antonio?page=3&')
        doc = Nokogiri::HTML(html)
        biz_name = doc.css('h2.h3 b').text
        type_biz = doc.css('h2.h3 span').text
        biz_number = doc.css('span.sm-block.lmargin.sm-nomargin').text
    end


    def self.scrape_forth_page
        
        html = open('https://www.texasblackpages.com/united-states/san-antonio?page=4&')
        doc = Nokogiri::HTML(html)
        biz_name = doc.css('h2.h3 b').text
        
        type_biz = doc.css('h2.h3 span').text
        biz_number = doc.css('span.sm-block.lmargin.sm-nomargin').text
    end


end

Scraper.scrape_second_page



