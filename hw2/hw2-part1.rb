require 'test/unit'

# A

class Numeric
  @@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id)
    method_id = singular_currency(method_id)
    if @@currencies.has_key?(method_id)
      self * @@currencies[method_id]
    else
      super
    end
  end
  
  def singular_currency(item)
    item.to_s.gsub( /s$/, '')
  end
  
  def in(currency)
    currency = singular_currency(currency)
    if @@currencies.has_key?(currency)
      self / @@currencies[currency]
    else
      raise "Cannot convert, unknown currency: #{currency}"
    end
  end
end

class String
  def palindrome?
    self.gsub(/\W/, "").downcase == self.gsub(/\W/, "").downcase.reverse
  end
end

module Enumerable
  def palindrome?
    self == self.reverse if self.is_a?(Array)
  end
end

class HW2Part1Test < Test::Unit::TestCase

  def test_to_dollars_singular
    base = Random.rand(100)
    assert base.yen == base * 0.013
    assert base.euro == base * 1.292
    assert base.rupee == base * 0.019
    assert base.dollar == base
  end
  
  def test_to_dollars_plural
    base = Random.rand(100)
    assert base.yens == base * 0.013
    assert base.euros == base * 1.292
    assert base.rupees == base * 0.019
    assert base.dollar == base
  end
    
  def test_singular_in
    base = Random.rand(100)
    assert base.yen.in(:euro) == base * 0.013 / 1.292
    assert base.euro.in(:rupee) == base * 1.292 / 0.019
    assert base.rupee.in(:rupee) == base * 0.019 / 0.019   
    assert base.dollar.in(:yen) == base / 0.013
  end

  def test_plural_in
    base = Random.rand(100)
    assert base.yens.in(:euros) == base * 0.013 / 1.292
    assert base.euros.in(:rupees) == base * 1.292 / 0.019
    assert base.yens.in(:euros) == base * 0.013 / 1.292
    assert base.rupees.in(:rupees) == base * 0.019 / 0.019
    assert base.dollars.in(:yens) == base / 0.013
    assert base.rupees.in(:dollars) == base * 0.019
  end

  def test_unknown_to_dollars
    begin
      100.kronor
      assert false
    rescue
    end
  end
  
  def test_unknown_in
    begin
      100.kronor.in(:dollars)
      assert false
    rescue
    end
  end
  
  def test_bad_string_palindrome
    assert !"foo".palindrome?
  end
  
  def test_good_string_palindrome
    assert "A man, a plan, a canal -- Panama".palindrome?
  end
  
  def test_bad_array_palindrome
    assert ![3,4].palindrome?
    assert ![3,4,5].palindrome?
  end
  
  def test_good_array_palindrome
    assert [3].palindrome?
    assert [3,4,3].palindrome?
    assert [1,2,3,2,1].palindrome?
  end
  
  def test_hash_palindrome
    {"hash" => "value"}.palindrome?
  end
end