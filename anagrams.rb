

def anagrams1(string)
  # O(n!)
  result = []
  string = string.split""

  if string.length == 1
    return [string[0]]
  end

  string.length.times do
    string.rotate!
    letter = string.take(1)
    substring = string.drop(1)
    substrings = anagrams1(substring.join)
    # debugger
    substrings.each do |word|
      word = word.split""
      word.unshift(letter)
      result << word.join
    end
  end

  result
end

def anagrams2(string1,string2)
  # O(n^2)

  return false unless string1.length == string2.length
  string1 = string1.chars
  string2 = string2.chars
  string_dup = string1.dup
  string1.each do |letter1|
    idx = nil
    string2.each do |letter2|
      if letter1 == letter2
        idx = string2.find_index{|el| el == letter1}
      end
    end
    string2.delete_at(idx) unless idx.nil?
  end
  string2.empty?

end

def anagrams3(string1,string2)
  # O(nlog(n))
  string1.chars.sort == string2.chars.sort
end

def anagrams4(string1,string2)
  # O(n)
  hash1 = Hash.new { |k,v| v = 0 }
  hash2 = Hash.new { |k,v| v = 0 }
  string1.chars.each do |letter|
    hash1[letter] += 1
  end
  string2.chars.each do |letter|
    hash2[letter] += 1
  end

  hash1 == hash2
end

def anagrams5(string1,string2)
  # O(n)
  hash = Hash.new { |k,v| v = 0 }
  string1.chars.each do |letter|
    hash[letter] += 1
  end
  string2.chars.each do |letter|
    hash[letter] -= 1
  end

  hash.all? { |k,v| v == 0 }
end

p anagrams2("sssss", "lives")
