require 'pry'

class Waiter
  
    attr_accessor :name, :yrs_experience

    @@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self
    end

    def self.all
        @@all
    end
    
    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        meals.max {|meal_a, meal_b| meal_a.tip <=> meal_b.tip}.customer
    end

    def meal_worst_tip
        meals.min {|meal_a, meal_b| meal_a.tip <=> meal_b.tip}
    end

    def self.avg_tips_most_exp
        oldest_waiter = Waiter.all.max {|waiter_a, waiter_b| waiter_a.yrs_experience <=> waiter_b.yrs_experience}
        num_meals = oldest_waiter.meals.length
        total_tips = older_waiter.meals.sum {|meal| meal.tip}
        total_tips / num_meals
    end

end