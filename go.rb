def calcFibN(num)
     fib_array = [0,1]
     (num-2).times do |i|
         fib_array << (fib_array[i] + fib_array[i+1])
     end
     #puts fib_array.join(", ")
end
30_00_000.times {
  calcFibN(30)
}