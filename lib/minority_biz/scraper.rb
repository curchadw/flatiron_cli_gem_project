require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative '../minority_biz/business.rb'


class Scraper
    
    
    
    
    def self.scrape_first_page
        
        html = open("https://www.texasblackpages.com/united-states/san-antonio")
        doc = Nokogiri::HTML(html)
        doc.css('div.grid_element').each do |business|    
            biz = Business.new
            biz.name = business.css('a b').text
            biz.type = business.css('span.hidden-xs').text
            biz.number = business.css('span.sm-block.lmargin.sm-nomargin').text.gsub("\r\n","").strip
            
            
        end 
        
    end

    def self.scrape_second_page
        
        html = open('https://www.texasblackpages.com/united-states/san-antonio?page=2')
        doc = Nokogiri::HTML(html)
        doc.css('div.grid_element').each do |business|    
            biz = Business.new
            biz.name = business.css('a b').text
            biz.type = business.css('span.hidden-xs').text
            biz.number = business.css('span.sm-block.lmargin.sm-nomargin').text.gsub("\r\n","").strip
        end  
    end


    def self.scrape_third_page
        
        html = open('https://www.texasblackpages.com/united-states/san-antonio?page=3&')
        doc = Nokogiri::HTML(html)
        doc.css('div.grid_element').each do |business|    
            biz = Business.new
            biz.name = business.css('a b').text
            biz.type = business.css('span.hidden-xs').text
            biz.number = business.css('span.sm-block.lmargin.sm-nomargin').text.gsub("\r\n","").strip
            
        end  
        
    end


    def self.scrape_fourth_page
        
        html = open('https://www.texasblackpages.com/united-states/san-antonio?page=4&')
        doc = Nokogiri::HTML(html)
        doc.css('div.grid_element').each do |business|    
            biz = Business.new
            biz.name = business.css('a b').text
            biz.type = business.css('span.hidden-xs').text
            biz.number = business.css('span.sm-block.lmargin.sm-nomargin').text.gsub("\r\n","").strip
            
        end
          
    end

    

    


     

end

















