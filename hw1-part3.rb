def combine_anagrams(words)
  hash = Hash.new{ |hash, key| hash[key] = [] }
  words.each do |word|
    hash[word.downcase.each_char.sort.join] << word
  end
  out = []
  hash.keys.each { |key| out << hash[key] }
  out.sort
end

# input = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
# input = ['A', 'a']
# puts (combine_anagrams input).inspect