fibonachi_array = [0, 1]

loop do
  next_fib = fibonachi_array[-2] + fibonachi_array[-1]
  break if next_fib > 100
  fibonachi_array.push(next_fib)
end

puts fibonachi_array.to_s