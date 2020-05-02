
require 'pry'
class Business
    

    

    attr_accessor :name, :type, :number
    @@all = Array.new

    def initialize(attributes=nil)
       if attributes
        attributes.each {|key,value| self.send(("#{key}="),value)}
        @@all << self
       end
        
    end

    def self.create_from_collection(business_array)
        business_array.each do |business_hash|
          Business.new(business_hash)
        end
    end

    def add_business_attributes(attributes_hash)
        attributes_hash.each do |key, value|
          self.send("#{key}=", value)
        end
        self
    end

    
    def self.all
        @@all
        
    end
end





