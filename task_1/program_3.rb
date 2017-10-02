print "Введите длинну первой стороны треугольника "
a = Float(gets.chomp)
print "Введите длинну второй стороны треугольника "
b = Float(gets.chomp)
print "Введите длинну третьей стороны треугольника "
c = Float(gets.chomp)

is_ravnobedren = false
is_ravnostoron = false
is_prayamougoln = false

if a == b && b == c && a == c
	is_ravnostoron = true
end

if a == b || b == c || c == a
	is_ravnobedren = true 
end

if(!is_ravnostoron)
	
	if(a >= b && a >= c)
		is_prayamougoln = b**2 + c**2 == a**2
	elsif(b >= a && b >= c)
		is_prayamougoln = a**2 + c**2 == b**2
	else
		is_prayamougoln = b**2 + a**2 == c**2
	end
end

if is_prayamougoln
	puts "Треугольник является прямоугольным"
else
	puts "Треугольник не является прямоугольным"
end

if is_ravnobedren
	puts "Треугольник является равнобедренным"
end

if is_ravnostoron
	puts "Треугольник является равносторонним"
end
