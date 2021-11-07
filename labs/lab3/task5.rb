require 'bigdecimal'

def Y(x, c, n)
  return ((x - c) / (x**(3.0/4) + x**(1.0/n) * c**(1.0/4))) *
        ((x**(1.0/2) * c**(1.0/4) + n**(1.0/4)) / (x**(1.0/2) + c**(1.0/2))) *
        (x**(1.0/4) / (c**(1.0/4)) * (x**(1.0/2) - 2 * x**(1.0/4) * c**(1.0/4) + c**(1.0/n)))
end

def Z(x)
  return Math.sin(2*x)**2 - Math.cos(Math::PI/3 - 2*x) * Math.sin(2*x - Math::PI/6) -
          Math.tan((Math::PI + x)/(x + 1))**(x/2.0)
end

def F(x, c, n)
  case x
  when 2...n
    return Y(x, c, n)
  when n...2*n
    return Z(x)
  else 
    return Y(x, c, n) + Z(x)
  end
end

def subtask1(c, n)
  x = 1.0
  step = (n - 1)/(n + c)
  puts "step is #{step}"
  while x <= n
    puts "#{x} | #{Y(x, c, n).round(10)}"
    x += step
  end
end

def subtask2(c, n)
  x = Math::PI / n
  step = (Math::PI - x)/((3/2)*n + c)
  puts "step is #{step}"
  while x <= Math::PI
    puts "#{x} | #{Z(x)}"
    x += step
  end
end

def subtask3(c, n)
  x = 2.0
  step = (c - 2)/(2 * n)
  puts "step is #{step}"
  while x <= c
    puts "#{x} | #{F(x, c, n)}"
    x += step
    return if x == c && step == 0
  end
end

puts "Task 5"
print "Enter N: "
n = gets.chomp.to_f

print "Enter c: "
c = gets.chomp.to_f

puts "Subtask 1:"
puts "x  |  Y"
subtask1(c, n)


puts "\nSubtask 2:"
puts "x  |  Z"
subtask2(c, n)

puts "\nSubtask 3:"
puts "x  |  F"
subtask3(c, n)