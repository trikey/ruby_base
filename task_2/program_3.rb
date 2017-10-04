fibonachi_array = [0, 1]

next_fib = fibonachi_array[-2] + fibonachi_array[-1]
while next_fib < 100
  fibonachi_array << next_fib
  next_fib = fibonachi_array[-2] + fibonachi_array[-1]
end

puts fibonachi_array.to_s