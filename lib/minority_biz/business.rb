require 'pry'

class Business
    

    @@all = []

    attr_accessor :name, :type, :number
    attr_reader :new_biz

    def initialize(name,type,number)
        @name = name
        @type = type
        @number = number
        @new_biz = {:biz_name => name, :biz_type => type, :biz_number => number}
        @@all.push(@new_biz)
    end


    def self.all
        @@all
        
    end
end



