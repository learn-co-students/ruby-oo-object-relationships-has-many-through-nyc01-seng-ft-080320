require 'pry'

class Customer
  
    attr_accessor :name, :age
    
    @@all = []
    @@meals = []

    def self.all
        @@all
    end

    def initialize(name,age)
        @name = name
        @age = age
        @@all << self
    end

    def new_meal(waiter,total,tip)
        tasty = Meal.new(waiter, self, total, tip)
        @@meals << tasty
    end

    def meals
        Meal.all.select {|meal| meal.customer == self}
    end

    def waiters
        self.meals.map {|meal| meal.waiter}
    end
    
end