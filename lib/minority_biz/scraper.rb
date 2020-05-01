require 'nokogiri'
require 'open-uri'
require 'pry'


class Scraper
    
    attr_accessor :array, :biz_name, :biz_number, :type_biz
    @@all = Array.new
    
    
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
                biz_name = business.css('a b').text
                type_biz = business.css('span.hidden-xs').text
                biz_number = business.css('span.sm-block.lmargin.sm-nomargin').text.gsub("\r\n","").strip
                @@all.push({name: biz_name, type: type_biz, number: biz_number}) 
        end  
     
      @@all
      binding.pry
    end


    def self.scrape_third_page
        
        html = open('https://www.texasblackpages.com/united-states/san-antonio?page=3&')
        doc = Nokogiri::HTML(html)
        doc.css('div.grid_element').each do |business|    
            biz_name = business.css('a b').text
            type_biz = business.css('span.hidden-xs').text
            biz_number = business.css('span.sm-block.lmargin.sm-nomargin').text.gsub("\r\n","").strip
            @@all.push({:name=> biz_name, :type => type_biz, :number => biz_number}) 
        end  
      
       @@all
    end


    def self.scrape_forth_page
        forth_page = Array.new
        html = open('https://www.texasblackpages.com/united-states/san-antonio?page=4&')
        doc = Nokogiri::HTML(html)
        doc.css('div.grid_element').each do |business|    
            biz_name = business.css('a b').text
            type_biz = business.css('span.hidden-xs').text
            biz_number = business.css('span.sm-block.lmargin.sm-nomargin').text.gsub("\r\n","").strip
            @@all.push({:business_name=> biz_name, :business_type => type_biz, :business_number => biz_number}) 
        end  
        
        @@all
    end

    def self.combine_results
        array = self.scrape_first_page + self.scrape_second_page + self.scrape_third_page + self.scrape_forth_page
        @@all.push(array)
        @@all
        
    end


    def self.all
        self.combine_results
        
        
    end



    

end

Scraper.scrape_second_page










