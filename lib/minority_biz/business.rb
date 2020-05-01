
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

    
    def self.all
        @@all
        
    end
end





