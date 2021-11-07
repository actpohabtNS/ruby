def Y(x)
  case x
  when -4..0
    return ((x-2).abs / (x**2 * Math.cos(x)))**(1.0/7.0)
  when 0..12
    return 1.0 / (Math.tan(x + Math.exp(-x)) / Math.sin(x)**2)**(1.0/4.5)
  else
    return 1 / ( 1 + x / (1 + x / (1 + x)))
  end
end


puts "Task 2"
puts "Y(-3) = #{Y(-3)}"
puts "Y(-0.5) = #{Y(-0.5)}"
puts "Y(5) = #{Y(5)}"
puts "Y(10.9) = #{Y(10.9)}"
puts "Y(13) = #{Y(13)}"
puts "Y(39.93) = #{Y(39.93)}"