print "Введите коэффициент a "
a = Float(gets.chomp)
print "Введите коэффициент b "
b = Float(gets.chomp)
print "Введите коэффициент c "
c = Float(gets.chomp)


d = b**2 - (4 * a * c)


if(d > 0)
	x_1 = (-b + Math.sqrt(d)) / (2 * a)
	x_2 = (-b - Math.sqrt(d)) / (2 * a)
	puts "Дискриминант равен #{d}, x1 равен #{x_1}, x2 равен #{x_2}"
elsif(d == 0)
	x = -b / (2 * a)
	puts "Дискриминант равен #{d}, корень равен #{x}"
else
	puts "Корней нет"
end