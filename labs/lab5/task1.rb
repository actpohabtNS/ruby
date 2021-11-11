#Variant 10

def integrate_rectangle(a, b, n, dx = (b - a) / n)
  x = a + dx / 2
  sum = 0
  (1..n).each {
    y = yield(x)
    sum += dx * y
    x += dx
  }
  return sum
end

def integrate_trapezoid(a, b, n, dx = (b - a) / n)
  x = a + dx
  sum = dx * (yield(a) / 2 - yield(b) / 2)
  loop {
    y = yield(x)
    sum += dx * y
    x += dx
    break if x > b
  }
  return sum
end

def f1(x)
  return 2/(1 - 4*x)
end

def f2(x)
  return Math.asin(Math.sqrt(x))/Math.sqrt(x*(1 - x))
end

puts "Task 1"
x = integrate_rectangle(2.2, -1.2, 100000.0) {|x| f1(x)}
puts x, "\n" # 0.4417658379359316
x = integrate_trapezoid(2.2, -1.2, 100000.0) {|x| f1(x)}
puts x, "\n" # 1.8939144050350413e-05

x = integrate_rectangle(0.2, 0.3, 100000.0) {|x| f2(x)}
puts x, "\n" # 0.12101
x = integrate_trapezoid(0.2, 0.3, 100000.0) {|x| f2(x)}
puts x, "\n" # 0.12101