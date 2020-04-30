require 'nokogiri'
require 'open-uri'
require 'pry'


class Scraper
    
   
    
    
    def self.scrape_first_page
        first_page = Array.new
        html = open("https://www.texasblackpages.com/united-states/san-antonio")
        doc = Nokogiri::HTML(html)
        doc.css('div.grid_element').each do |business|    
            biz_name = business.css('a b').text
            type_biz = business.css('span.hidden-xs').text
            biz_number = business.css('span.sm-block.lmargin.sm-nomargin').text.gsub("\r\n","").strip
            first_page.push({:business_name=> biz_name, :business_type => type_biz, :business_number => biz_number}) 
         end  
         first_page
    end

    def self.scrape_second_page
        second_page = Array.new
        html = open('https://www.texasblackpages.com/united-states/san-antonio?page=2')
        doc = Nokogiri::HTML(html)
        doc.css('div.grid_element').each do |business|    
                biz_name = business.css('a b').text
                type_biz = business.css('span.hidden-xs').text
                biz_number = business.css('span.sm-block.lmargin.sm-nomargin').text.gsub("\r\n","").strip
                second_page.push({:business_name=> biz_name, :business_type => type_biz, :business_number => biz_number}) 
        end  
     
      second_page
      
    end


    def self.scrape_third_page
        third_page = Array.new
        html = open('https://www.texasblackpages.com/united-states/san-antonio?page=3&')
        doc = Nokogiri::HTML(html)
        doc.css('div.grid_element').each do |business|    
            biz_name = business.css('a b').text
            type_biz = business.css('span.hidden-xs').text
            biz_number = business.css('span.sm-block.lmargin.sm-nomargin').text.gsub("\r\n","").strip
            third_page.push({:business_name=> biz_name, :business_type => type_biz, :business_number => biz_number}) 
        end  
        binding.pry
       third_page
    end


    def self.scrape_forth_page
        forth_page = Array.new
        html = open('https://www.texasblackpages.com/united-states/san-antonio?page=4&')
        doc = Nokogiri::HTML(html)
        doc.css('div.grid_element').each do |business|    
            biz_name = business.css('a b').text
            type_biz = business.css('span.hidden-xs').text
            biz_number = business.css('span.sm-block.lmargin.sm-nomargin').text.gsub("\r\n","").strip
            forth_page.push({:business_name=> biz_name, :business_type => type_biz, :business_number => biz_number}) 
        end  
 
        forth_page
    end


end

Scraper.scrape_third_page



