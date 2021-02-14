require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative '../minority_biz/business.rb'


class Scraper
    
    
   
    def self.scrape(url)
        
        html = open(url)
        
        doc = Nokogiri::HTML(html)
        doc.css('div.grid_element').each do |business|    
            biz = Business.new
            biz.name = business.css('a b').text
            biz.type = business.css('span.hidden-xs').text
            biz.number = business.css('span.sm-block.lmargin.sm-nomargin').text.gsub("\r\n","").strip
            
            
        end 
        
    end

    
    
    
    
   

    

    


     

end

















