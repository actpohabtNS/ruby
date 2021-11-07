# ================================== Task 1 ==================================

verticies = [[52,289],  [46,258],   [63,240],   [94,234],   [132,236],
             [184,234], [198,207],  [171,181],  [120,171],  [92,157],
             [49,134],  [43,99],    [63,82],    [109,69],   [157,59],
             [202,57],  [245,51],   [278,47],   [309,41],   [340,31],
             [379,33],  [415,61],   [430,86],   [447,140],  [474,196],
             [483,245], [471,274],  [411,292],  [350,302],  [299,308],
             [250,309], [193,308],  [154,308],  [111,309],  [84,302], [52,289]]

def S(verticies)
  sum = 0
  verticies.each_cons(2) { |vs|
    x1 = vs[0][0]
    y1 = vs[0][1]
    x2 = vs[1][0]
    y2 = vs[1][1]

    sum += (x1 + x2) * (y1 - y2)
  }

  return sum.abs / 2
end

puts "Task 1"
puts "The area of the figure is #{S(verticies)}"


# ================================== Task 2 ==================================

def Diap(r, t, p)
  return p**r * (1 - p**(-(t - 1))).to_f.round
end

puts "\nTask 2"
puts "Range is #{Diap(16, 64, 2)}"



# ================================== Task 3 ==================================

def toDec(numStr, base = 2)
  num = 0
  numStr.split('').map(&:to_i).reverse.each_with_index {
    |dig, idx|
    num += base**idx if dig == 1
  }
  return num
end

def biToDec(numStr)
  return toDec(numStr, 2)
end

task3NumStr = "100011111001"

puts "\nTask 3"
puts "#{task3NumStr} in decimal is #{biToDec(task3NumStr)}"


# ================================== Task 4 ==================================

def decToBi(num)
  numStr = ''
  while num > 0
    numStr += (num % 2).to_s
    num /= 2
  end
  return numStr.reverse
end

task4Num = 444
puts "\nTask 4"
puts "#{task4Num} in binary is #{decToBi(task4Num)}"
