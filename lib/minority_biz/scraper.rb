require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative '../minority_biz/business.rb'


class Scraper
    
    attr_accessor :array, :biz_name, :biz_number, :type_biz
    
    
    def self.scrape_first_page
        
        html = open("https://www.texasblackpages.com/united-states/san-antonio")
        doc = Nokogiri::HTML(html)
        doc.css('div.grid_element').each do |business|    
            new_biz = Business.new
            new_biz.name = business.css('a b').text
            new_biz.type = business.css('span.hidden-xs').text
            new_biz.number = business.css('span.sm-block.lmargin.sm-nomargin').text.gsub("\r\n","").strip
        end 
    end

    def self.scrape_second_page
        
        html = open('https://www.texasblackpages.com/united-states/san-antonio?page=2')
        doc = Nokogiri::HTML(html)
        doc.css('div.grid_element').each do |business|    
            new_biz = Business.new
            new_biz.name = business.css('a b').text
            new_biz.type = business.css('span.hidden-xs').text
            new_biz.number = business.css('span.sm-block.lmargin.sm-nomargin').text.gsub("\r\n","").strip
        end  
    end


    def self.scrape_third_page
        
        html = open('https://www.texasblackpages.com/united-states/san-antonio?page=3&')
        doc = Nokogiri::HTML(html)
        doc.css('div.grid_element').each do |business|    
            new_biz = Business.new
            new_biz.name = business.css('a b').text
            new_biz.type = business.css('span.hidden-xs').text
            new_biz.number = business.css('span.sm-block.lmargin.sm-nomargin').text.gsub("\r\n","").strip
            
        end  
        
    end


    def self.scrape_forth_page
        forth_page = Array.new
        html = open('https://www.texasblackpages.com/united-states/san-antonio?page=4&')
        doc = Nokogiri::HTML(html)
        doc.css('div.grid_element').each do |business|    
            new_biz = Business.new
            new_biz.name = business.css('a b').text
            new_biz.type = business.css('span.hidden-xs').text
            new_biz.number = business.css('span.sm-block.lmargin.sm-nomargin').text.gsub("\r\n","").strip
            
            
        end  
    end

    def self.business_listings
        Business.all.each do |new_biz|
            puts "Name: #{new_biz.name}"
            puts "Type: #{new_biz.type}"
            puts "Phone #: #{new_biz.number}"
            
        end
        
    end
     

end


Scraper.scrape_third_page









