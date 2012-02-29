def palindrome?(string)
  return false if string.nil?
  cleanString = string.gsub(/\W/, '').downcase
  return cleanString.eql?(cleanString.reverse)
end

#["A man, a plan, a canal -- Panama", "Madam, I'm Adam!", "Abracadabra", nil].each { |string|
#  puts "[" + (string || "nil") + "] is" + (palindrome?(string) ? " " : " not ") + "a palindrome"
#}

def count_words(string)
  wordCount = Hash.new(0)
  string.downcase.split(/\W+/).each{ |word| wordCount[word] += 1 } unless string.nil?
  return wordCount
end

#["A man, a plan, a canal -- Panama", "Doo bee doo bee doo", nil].each { |string|
#  puts "[" + (string || "nil") + "] has counts -> " + count_words(string).to_s
#}