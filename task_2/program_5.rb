print 'введите день: '
day = gets.chomp.to_i
print 'введите месяц: '
month = gets.chomp.to_i
print 'введите год: '
year = gets.chomp.to_i

is_visokosniy = (year % 4 == 0 && year % 100 != 0) || year % 400 == 0

months = [31, is_visokosniy ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

number = day
(0..month - 2).each { |month_num| number += months[month_num] }

puts number