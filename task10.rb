class Train
  attr_accessor :dest
  attr_accessor :num
  attr_accessor :depTime
  attr_accessor :seats
  attr_accessor :seatsLux
  attr_accessor :seatsCom
  attr_accessor :seatsEc

  def initialize(dest, num, depTime, seats, seatsLux, seatsCom, seatsEc)
    @dest = dest
    @num = num
    @depTime = depTime
    @seats = seats
    @seatsLux = seatsLux
    @seatsCom = seatsCom
    @seatsEc = seatsEc
  end

  def toString
    return "Train # #{@num} to #{@dest} departing at #{@depTime} with #{seats} seats (Lux: #{@seatsLux}, Common: #{@seatsCom}, Econom: #{seatsEc})"
  end
end

class Trains
  def initialize(trains)
    @trains = trains
  end

  def filterDest(dest)
    return Trains.new(@trains.select { |train| train.dest == dest })
  end

  def filterAfterDep(depTime)
    return Trains.new(@trains.select { |train| train.depTime >= depTime })
  end

  def filterSeats(seats)
    return Trains.new(@trains.select { |train| train.seats == seats })
  end

  def toString
    res = ""
    @trains.each { |train| res += train.toString + "\n" }
    return res
  end
end

t1 = Train.new("Kyiv", 741, Time.new(2021, 11, 5, 16, 31), 300, 100, 100, 100)
t2 = Train.new("Kyiv", 534, Time.new(2021, 11, 5, 19, 20), 500, 200, 200, 100)
t3 = Train.new("Kyiv", 11, Time.new(2021, 11, 5, 5, 11), 200, 100, 100, 0)
t4 = Train.new("Odesa", 123, Time.new(2021, 11, 5, 11, 53), 400, 50, 200, 150)
t5 = Train.new("Lviv", 642, Time.new(2021, 11, 5, 11, 40), 300, 100, 100, 100)
t6 = Train.new("Odesa", 333, Time.new(2021, 11, 5, 9, 3), 400, 50, 200, 150)
trains = Trains.new([t1, t2, t3, t4, t5, t6])

puts "================= ALL TRAINS ================="
puts trains.toString

puts "\n================= TO KYIV ================="
puts trains.filterDest("Kyiv").toString


puts "\n================= TO KYIV AFTER 15:00 ================="
puts trains.filterDest("Kyiv").filterAfterDep(Time.new(2021, 11, 5, 15, 00)).toString

puts "\n================= TO ODESA EQUAL SEATS ================="
puts trains.filterDest("Odesa").filterSeats(400).toString
