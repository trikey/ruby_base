numbers = []

(10..100).each { |number| numbers.push(number) if number % 5 == 0 }

puts numbers.to_s