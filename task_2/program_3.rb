fibonachi_array = [0, 1]

while (next_fib = fibonachi_array[-2] + fibonachi_array[-1]) < 100
  fibonachi_array << next_fib
end

puts fibonachi_array.to_s