def palindrome?(string)
  stripped_string = string.gsub(/\W/, "").downcase
  stripped_string == stripped_string.reverse
end

# palindrome?("A man, a plan, a canal -- Panama") #=> true 
# palindrome?("Madam, I'm Adam!") # => true 
# palindrome?("Abracadabra") # => false (nil is also ok)

def count_words(string)
  hash = Hash.new(0)
  string.scan(/\w+/).each {|t| hash[t.downcase] = hash[t.downcase] + 1}
  hash
end

# count_words("A man, a plan, a canal -- Panama") # => {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1} 
# count_words "Doo bee doo bee doo" # => {'doo' => 3, 'bee' => 2}
