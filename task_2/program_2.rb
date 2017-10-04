numbers = []

(10..100).each { |number| numbers << number if number % 5 == 0 }

puts numbers.to_s