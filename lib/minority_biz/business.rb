

class Business
    

    

    attr_accessor :name, :type, :number
    @@all = Array.new

    def initialize(attirbutes)
        attirbutes.each {|key,value| self.send(("#{key}="),value)}
        @@all << self
    end




    def self.all
        @@all
        
    end
end



