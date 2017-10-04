cart = {}

loop do
  print 'введите название товара: '
  name = gets.chomp
  break if name == 'стоп'
  if cart[name.to_sym].nil?
    print 'введите цену: '
    price = gets.chomp.to_f
    print 'введите количество: '
    quantity = gets.chomp.to_f
    cart[name.to_sym] = { price: price, quantity: quantity} 
  else
    print 'товар уже есть в коризне, сколько еще добавить? '
    quantity = gets.chomp.to_f
    cart[name.to_sym][:quantity] += quantity
  end
end

sum = 0
cart.each { |name, item| sum += item[:price] * item[:quantity] }

puts cart
puts "Итого: #{sum}"