# require 'test/unit'

class CartesianProduct
  include Enumerable

  def initialize(a1, a2)
    @a1, @a2 = a1, a2
  end
  
  def each()
    @a1.each { |elt1| @a2.each {|elt2| yield [elt1,elt2]}}
  end
end

# class HW2Part2Test < Test::Unit::TestCase
#   def test_1
#     expected = [[:a,4],[:a,5],[:b,4],[:b,5],[:c,4],[:c,5]]
#     actual = []
#     CartesianProduct.new([:a,:b,:c],[4,5]).each {|e| actual << e}
#     assert expected == actual
#   end
#   
#   def test_2
#     expected = [[:a,4],[:a,5],[:b,4],[:b,5]]
#     actual = []
#     CartesianProduct.new([:a,:b], [4,5]).each {|e| actual << e}
#     assert expected == actual
#   end
#   
#   def test_3
#     expected = []
#     actual = []
#     CartesianProduct.new([:a,:b], []).each {|e| actual << e}
#     assert expected == actual
#   end
#   
#   def test_4
#     expected = []
#     actual = []
#     CartesianProduct.new([], []).each {|e| actual << e}
#     assert expected == actual
#   end
#   
# end
# 
# 
# 
# 
# c = CartesianProduct.new([:a,:b], [4,5])
# c.each { |elt| puts elt.inspect }
# # [:a, 4]
# # [:a, 5]
# # [:b, 4]
# # [:b, 5]
# 
# c = CartesianProduct.new([:a,:b], [])
# c.each { |elt| puts elt.inspect }
# # (nothing printed since Cartesian product
# # of anything with an empty collection is empty)