print "Введите длинну первой стороны треугольника "
a = gets.chomp.to_f
print "Введите длинну второй стороны треугольника "
b = gets.chomp.to_f
print "Введите длинну третьей стороны треугольника "
c = gets.chomp.to_f

is_ravnobedren = false
is_ravnostoron = false
is_prayamougoln = false

if a == b && b == c && a == c
  is_ravnostoron = true
end

if a == b || b == c || c == a
  is_ravnobedren = true 
end

if !is_ravnostoron
  sides = [a, b, c]
  gipotenuza = sides.delete(sides.max)
  katet_1 = sides.pop
  katet_2 = sides.pop
  is_prayamougoln = katet_1**2 + katet_2**2 == gipotenuza**2
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
