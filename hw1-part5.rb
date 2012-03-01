# require 'test/unit'

class Class 
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s	# make sure it's a string
    attr_reader attr_name	# create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{
        def #{attr_name}= value  
          ( @#{attr_name+'_history'} ||= [nil] ) << value
          @#{attr_name} = value
        end
    }
  end
end

class Foo 
  attr_accessor_with_history :bar
end 


# class FooTest < Test::Unit::TestCase
#   def test_foo
#     f = Foo.new 
#     f.bar = 1
#     f.bar = "cat" 
#     assert f.bar_history == [nil, 1, "cat"]
#     f = Foo.new 
#     f.bar = 4
#     f.bar = 8 
#     assert f.bar_history == [nil, 4, 8]
#   end
# end
