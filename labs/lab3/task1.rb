def Logic1(a, b, c, x, y, z)
  puts "1)"
  puts "a) !(a || b) && (a || !b) = #{!(a || b) && (a || !b)}"
  puts "b) (z != y) == (6 >= y) && a || b && c && x >= 1.5 = #{(z != y) == (6 >= y) && a || b && c && x >= 1.5}"
  puts "c) (8 - x * 2 <= z) && (x**2 <=> y**2) || (z >= 15) = #{(8 - x * 2 <= z) && (x**2 >= y**2) || (z >= 15)}"
  puts "d) x > 0 && y < 0 || z >= ((x*y + (-y/x)) + -z) = #{x > 0 && y < 0 || z >= ((x*y + (-y/x)) + -z)}"
  puts "e) !(a || b && !(c || (!a || b))) = #{!(a || b && !(c || (!a || b)))}"
  puts "f) x**2 + y**2 >= 1 && x >=0 && y >= 0 = #{x**2 + y**2 >= 1 && x >=0 && y >= 0}"
  puts "g) (a && (c && b == b || a) || c) && b  = #{(a && (c && b == b || a) || c) && b}"
end

def Logic2(n, m, p, q)
  puts "2)"
  puts "(n/m + m/n > 3) && (p && q || !p && q) = #{(n/m + m/n > 3) && (p && q || !p && q)}"
end

puts "Task 1"
Logic1(true, true, false, 20, 60, 4)
puts
Logic2(3, -6, false, false)