#Variant 10

def series_sum(x, n)
  x_left_bound = 0.1
  x_right_bound = 1
  n_left_bound = 20
  n_right_bound = 58
  if x < x_left_bound || x > x_right_bound
    raise "X is out of bounds"
  end

  sum = 0
  if n >= n_left_bound && n <= n_right_bound
    (0..n).each {
      |i|
      sum += yield(x, i)
    }
  else
    e = 0.001
    fault = e + 1
    prev_sum = sum
    i = 0
    while i < 100 || fault > e
      sum += yield(x, i)

      i += 1
      fault = (prev_sum - sum).abs
      prev_sum = sum
    end
  end

  return sum
end

def series_f(x, i)
  Math.cos((2 * i - 1) * x) / (2 * i - 1)**2
end

puts "Task 2"
x = series_sum(0.5, 100) {|x, i| series_f(x, i)}
puts x, "\n"