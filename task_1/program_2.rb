print "Введите основание треугольника "
a = Float(gets.chomp)
print "Введите высоту треугольника "
h = Float(gets.chomp)

s = 0.5 * a * h

puts "Площадь треугольника равна #{s.to_s}"