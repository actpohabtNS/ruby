require 'bigdecimal'

def Series1(n)
  sum = 0
  fact = 2

  (2..n).each {
    |n|
    sum += ((fact / (n - 1)) / (fact * (n + 1)))**(n * (n + 1))
    fact *= (n + 1)
  }

  return sum
end

def Series2(a, x, n)
  sum = 1
  fact = 1

  (1..n).each {
    |n|
    sum += (BigDecimal((x * Math.log(a)).to_s).round(10) ** n) / fact
    fact *= (n + 1)
  }

  return sum.to_f
end

def Series3(n)
  sum = 0
  facts = [2, 2, 24, 2]

  (1..n).each {
    |n|
    sum += (facts[0] * facts[1]) / (facts[2] * facts[3])
    facts[0] *= (3*n) * (3*n + 1) * (3*n + 2)
    facts[1] *= (n + 2)
    facts[2] *= (4*n + 1) * (4*n + 2) * (4*n + 3) * (4*n + 4)
    facts[3] *= (2*n + 1) * (2*n + 2)
  }

  return sum
end

puts "Task 4"
puts "Series 1 converges to #{Series1(1000)}"
print "Enter a for Series2 (a^x): "
a = gets.chomp.to_f
print "Enter x for Series2 (a^x): "
x = gets.chomp.to_f
puts "Series 2 converges to (a^x): #{Series2(a, x, 1000)}"
puts "Series 3 converges to #{Series3(1000)}"
