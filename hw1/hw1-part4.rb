# require 'test/unit'

class Dessert 
  attr_accessor :name, :calories
  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  def healthy?
    @calories < 200
  end

  def delicious?
    true
  end 

end

class JellyBean < Dessert
  
  attr_accessor :flavor
   
  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end
  
  def delicious?
    @flavor.downcase != "black licorice"
  end 
end


# class DessertTest < Test::Unit::TestCase
#   def test_jelly_bean
#     jb = JellyBean.new('blue', 110, 'green')
#     assert jb.delicious? == true
#     assert jb.healthy? == true
#     jb = JellyBean.new('yellow', 330, 'BLACK licorice')
#     assert jb.healthy? == false
#     assert jb.delicious? == false
#     jb = JellyBean.new('orange', 1, 'black licorice')
#     assert jb.healthy? == true
#     assert jb.delicious? == false
#   end
#   
#   def test_dessert
#     d = Dessert.new('donut', 800)
#     assert d.healthy? == false
#     assert d.delicious? == true
#     d = Dessert.new('john', 100)
#     assert d.healthy? == true
#     assert d.delicious? == true
#   end
# end