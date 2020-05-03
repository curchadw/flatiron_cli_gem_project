require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative '../minority_biz/business.rb'


class Scraper
    
    
    
    
    def self.scrape_first_page
        
        html = open("https://www.texasblackpages.com/united-states/san-antonio")
        doc = Nokogiri::HTML(html)
        doc.css('div.grid_element').each do |biz|    
            biz = Business.new
            biz.name = business.css('a b').text
            biz.type = business.css('span.hidden-xs').text
            biz.number = business.css('span.sm-block.lmargin.sm-nomargin').text.gsub("\r\n","").strip
            
        end 
    end

    def self.scrape_second_page
        
        html = open('https://www.texasblackpages.com/united-states/san-antonio?page=2')
        doc = Nokogiri::HTML(html)
        doc.css('div.grid_element').each do |biz|    
            biz = Business.new
            biz.name = business.css('a b').text
            biz.type = business.css('span.hidden-xs').text
            biz.number = business.css('span.sm-block.lmargin.sm-nomargin').text.gsub("\r\n","").strip
        end  
    end


    def self.scrape_third_page
        
        html = open('https://www.texasblackpages.com/united-states/san-antonio?page=3&')
        doc = Nokogiri::HTML(html)
        doc.css('div.grid_element').each do |biz|    
            biz = Business.new
            biz.name = business.css('a b').text
            biz.type = business.css('span.hidden-xs').text
            biz.number = business.css('span.sm-block.lmargin.sm-nomargin').text.gsub("\r\n","").strip
            
        end  
        
    end


    def self.scrape_forth_page
        forth_page = Array.new
        html = open('https://www.texasblackpages.com/united-states/san-antonio?page=4&')
        doc = Nokogiri::HTML(html)
        doc.css('div.grid_element').each do |biz|    
            biz = Business.new
            biz.name = business.css('a b').text
            biz.type = business.css('span.hidden-xs').text
            biz.number = business.css('span.sm-block.lmargin.sm-nomargin').text.gsub("\r\n","").strip
        end  
    end

    def self.business_listings
        Business.all.each_with_index do |i,biz|
            puts"#{i}:"
            puts "Name: #{biz.name}"
            puts "Type of Business: #{biz.type}"
            puts "Phone Number: #{biz.number}"
        end
        
    end
     

end












