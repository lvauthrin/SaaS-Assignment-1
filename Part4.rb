class Dessert
 attr :name, true
 attr :calories, true

 def initialize(name, calories)
  @name = name
  @calories = calories
 end

 def healthy?
  return @calories < 200
 end

 def delicious?
  return true
 end

end

class JellyBean < Dessert
 attr :flavor, true
  
 def initialize(name, calories, flavor)
  super(name, calories)
  @flavor = flavor
 end

 def delicious?
  return !@flavor.eql?("black licorice") && super
 end

end

#[Dessert.new("eclair", 300), Dessert.new("banana", 199), JellyBean.new("jellybean", 100, "black licorice")].each { |dessert|
# puts dessert.name + " is" + (dessert.healthy? ? " " : " not ") + "healthy and is" + (dessert.delicious? ? " " : " not ") + "delicious"
#}