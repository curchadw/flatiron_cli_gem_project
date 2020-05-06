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

    def self.business_listings
        Business.all.each.with_index(1) do |biz,i|
           
            puts "#{i}.#{biz.name}"
            # puts "Type of Business: #{biz.type}"
            # puts "Phone Number: #{biz.number}"
        end
        
    end

    def self.find_by_index
        input = gets.to_i
        if (1..Business.all.length).include?(input)
            Business.each_with_index do |item,i| 
            puts "#{item.name}"
            puts "#{item.type}"
            puts "#{item.number}"
           
            end
        else
            puts"Item does not exist"    
        end
        [input - 1]
        
           
             
         
    end


     

end

















