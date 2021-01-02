# frozen_string_literal: true

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

# Returns how many times a word appears in a String.
class String
  def count_instances_of(word)
    downcase.scan(word).count
  end
end

def substrings(string, dictionary)
  {}.tap do |hsh|
    dictionary.each do |word|
      if string.downcase.include?(word)
        hsh[word] = string.count_instances_of(word)
      end
    end
  end
end

puts substrings('Below', dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
