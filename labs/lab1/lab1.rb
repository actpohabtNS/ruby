print "Input x: "
x = gets.chomp.to_f

print "\nInput a: "
a = gets.chomp.to_f

print "\nInput phi: "
phi = gets.chomp.to_f

def Y(x, a, phi)
  return (4.1 * 10**-1.7) / (x - Math::PI) * Math.sin(5*x) + (Math.tan(x.abs) ** 3 - Math.log10(Math.sqrt(a + phi))) / Math::E ** Math::PI
end

y = Y(x, a, phi)

puts "\nY = #{y}"
