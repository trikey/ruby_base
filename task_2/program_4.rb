letters = ('a'..'z').to_a
vowels = %w( a e i o u y )

vowels_hash = {}

letters.each_with_index { |letter, index| vowels_hash[letter] = index + 1 if vowels.include? letter }

puts vowels_hash