class Waiter
    attr_accessor :name, :years

    @@all = []

    def initialize(name, years = 0)
        @name = name
        @years = years
        @@all.push(self)
    end

    def self.all
        @@all
    end  

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meal_instances
        Meal.all.select do |m|
            m.waiter == self
        end
    end

    def meals
        meal_instances.map do |e|
            e
        end
    end

    def best_tipper
        big_instance = Meal.all.max_by do |x|
            x.tip
        end
        big_instance.customer
    end

end