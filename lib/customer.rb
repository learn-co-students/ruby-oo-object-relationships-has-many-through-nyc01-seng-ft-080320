class Customer
    attr_accessor :name, :age

    @@all = []
    
    def initialize(name, age)
        @name = name
        @age = age
        @@all.push(self)
    end

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip)
        Meal.new(waiter, self, total, tip)
    end

    def meal_instances
        Meal.all.select do |m|
            m.customer == self
        end
    end

    def meals
        meal_instances.map do |e|
            e
        end
    end

    def waiters
        meal_instances.map do |e|
            e.waiter
        end
    end

end