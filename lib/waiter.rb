class Waiter
    attr_accessor :name, :years
    @@all = []

    def initialize (name, years)
        self.name = name
        self.years = years

        @@all << self
    end

    def self.all
        @@all
    end

    ##               methods

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.filter do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        max_tipped = self.meals.find do |meal|
            meal.tip == self.get_max_tip(self.meals)
        end
        max_tipped.customer
    end

    def get_max_tip(arr_meals)
        max_tip = -1
        arr_meals.each do |meal|
            if meal.tip > max_tip
                max_tip = meal.tip
            end
        end
        max_tip
    end
end