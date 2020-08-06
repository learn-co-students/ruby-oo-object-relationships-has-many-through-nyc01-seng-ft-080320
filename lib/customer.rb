class Customer
    attr_accessor :name, :age
   
    @@all = []
   
    def initialize(name, age)
      @name = name
      @age = age
      @@all << self
    end
   
    def self.all
      @@all
    end
   
    def new_meal(waiter, total, tip)
      meal = Meal.new(self, waiter, total, tip);
    end
    
    def meals
      Meal.all.filter{|meal| meal.customer == self}
    end

    def waiters
      self.meals.map {|meal| meal.waiter};
    end
   
  end