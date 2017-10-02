print "Ваше имя? "
name = gets.chomp
print "Ваш рост? "
growth = Integer(gets.chomp)


text = "#{name}, Ваш вес "
weight = growth - 110
if(weight >= 0)
	puts text + weight.to_s + " кг"
else
	puts text + "уже оптимальный"
end