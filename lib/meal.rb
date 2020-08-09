class Meal
 
attr_accessor :waiter, :customer, :total, :tip
   
@@all = []
@@tip = []
   
  def initialize(waiter, customer, total, tip=0)
    @waiter = waiter
    @customer = customer
    @total = total
    @tip = tip
    @@all << self
    @@tip << Array[tip, waiter, customer]
  end
   
  def self.all
    @@all
  end

  def self.all_tips
    @@tip
  end
    
   def new_meal(waiter, total, tip=0)
      Meal.new(waiter, self, total, tip)
    end
  

  end