class Meal
    attr_accessor :customer, :waiter, :total, :tip
    @@all = [];

    def initialize(custy, waity, toty, tip) #im being so lazy loooool
        @customer = custy;
        @waiter = waity;
        @total = toty;
        @tip = tip;
        
        @@all.push(self);
    end

    def self.all
        @@all;
    end
end