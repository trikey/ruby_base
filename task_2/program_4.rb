letters = ('a'..'z').to_a
vowels = ['a', 'e', 'i', 'o', 'u', 'y']

vowels_hash = {}

letters.each { |letter| vowels_hash[letter] = letters.index(letter) + 1 if vowels.include? letter }

puts vowels_hash