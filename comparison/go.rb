# right answer:
# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946, 17711, 28657, 46368, 75025, 121393, 196418, 317811, 514229

def calcFibN(num)
     fib_array = [0,1]
     (num-2).times do |i|
         fib_array << (fib_array[i] + fib_array[i+1])
     end
     #fib_array.join(", ")
end
30_00_000.times {
  calcFibN(30)
}