def combine_anagrams(words)
  wordCombinations = Hash.new { |hash, key| hash[key] = Array.new }
  words.each {|word| wordCombinations[word.downcase.split(//).sort.join].push(word) }
  return wordCombinations.values
end

#puts combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']).to_s