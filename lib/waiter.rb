class Waiter

    attr_accessor :name, :years_experience

    @@all = []

    def self.all
        @@all
    end

    def initialize(name, years_experience)
        @name = name
        @years_experience = years_experience
        @@all << self
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals   
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        meal_instance = meals.max_by do |a|
            a.tip
        end
        meal_instance.customer
    end

end