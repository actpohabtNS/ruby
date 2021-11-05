print "Input a: "
a = gets.chomp.to_f

print "Input b: "
b = gets.chomp.to_f

print "Input c: "
c = gets.chomp.to_f

print "Input x_start: "
x_start = gets.chomp.to_f

print "Input x_end: "
x_end = gets.chomp.to_f

print "Input delta_x: "
delta_x = gets.chomp.to_f

puts "\n====================="
puts "You have inputted:"
puts "a: #{a}"
puts "b: #{b}"
puts "c: #{c}"
puts "x_start: #{x_start}"
puts "x_end: #{x_end}"
puts "delta_x: #{delta_x}"


def F(x, a, b, c)

  res = 0
  if (a < 0 && x != 0)
    res = a * x**2 + b**2 * x
  elsif (a > 0 && x == 0)
    res = x - a / (x - c)
  else
    res = 1 + x / c
  end

  res.truncate! if (!(a.truncate || b.truncate) && (b.truncate || c.truncate)) == 0
  return res
end

def F_interval(a, b, c, x_start, x_end, delta_x)
  x_es = []
  f_es = []

  x = x_start
  while x < x_end
    x_es.push(x)
    f_es.push(F(x, a, b, c))
    x += delta_x
  end

  return x_es, f_es
end

if x_start >= x_end
  puts "x_start (#{x_start}) must be bigger than x_end (#{x_end})!"
elsif delta_x <= 0
  puts "delta_x (#{delta_x}) must be bigger than 0!"
else
  x_es, f_es = F_interval(a, b, c, x_start, x_end, delta_x)

  puts "\n====================="
  puts "x | f"
  x_es.length.times {
    |n|
    puts "-------"
    puts "#{x_es[n]} | #{f_es[n]}"
  }
end
