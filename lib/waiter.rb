class Waiter

    attr_reader :name, :years_of_experience
    @@all = [];


    def initialize(name, years_of_experience)
        @name = name;
        @years_of_experience = years_of_experience;
        @@all.push(self);
    end

    def self.all
        @@all;
    end

    def new_meal(custy, total, tip)
        newMeal = Meal.new(custy, self, total, tip);
    end

    def meals
        Meal.all.filter{|meal| meal.waiter == self};
    end

#     a <=> b :=
#   if a < b then return -1
#   if a = b then return  0
#   if a > b then return  1
#   if a and b are not comparable then return nil

    def best_tipper
        daPhatestTip = self.meals.max {|maxMeal, otherMeal| maxMeal.tip <=> otherMeal.tip}
        daPhatestTip.customer;
    end
end