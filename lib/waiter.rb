class Waiter
attr_accessor :name, :experience
@@all=[]
def initialize(name, experience)
    @name = name
    @experience = experience
    @@all << self
end
def self.all
    @@all
end
def new_meal(customer, total, tip)
    meal = Meal.new(self, customer, total, tip)
end
def meals
    Meal.all.select do |meal|
      meal.waiter == self 
    end
end
def find_high_tip(meals)
    high_tip = 0
    meals.each do |meal|
        if meal.tip > high_tip
            high_tip = meal.tip
        end
    end
    high_tip
end
def best_tipper
    best_tip = self.meals.find do |meal|
        meal.tip == self.find_high_tip(self.meals)
    end
    best_tip.customer
end

 
end