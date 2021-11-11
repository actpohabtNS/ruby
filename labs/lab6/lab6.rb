#Variant 10

#supposing we have only 4 years at university
MAX_YEAR = 4

class Student
  attr_reader :name
  attr_reader :surname
  attr_reader :lastname
  attr_reader :sex
  attr_reader :age
  attr_reader :year

  def initialize(name, surname, lastname, sex, age, year)
    @name = name
    @surname = surname
    @lastname = lastname
    @sex = sex
    @age = age
    @year = year
  end

  def toString
    return "#{surname} #{name} #{lastname}, #{sex}, #{age} y.o., #{year} year"
  end
end

class Faculty
  attr_reader :students

  def initialize(students)
    @students = students
  end

  def mostMaleYear
    years = Array.new(MAX_YEAR)
    years[0] = 0
    1.upto(MAX_YEAR) {
      |year|
      studs = self.filter(:year, year)
      males = studs.filter(:sex, "male")
      years[year] = males.students.length.to_f / studs.students.length
    }

    #puts years
    return years.index(years.max), years.max
  end

  def alphabetical(field)
    return Faculty.new(@students.sort { |s1, s2| s1.send(field) <=> s2.send(field) })
  end

  def filter(field, value)
    return Faculty.new(@students.select { |s| s.send(field) == value })
  end

  def mostCommon(field)
    freques = @students.each_with_object(Hash.new(0)){|key,hash| hash[key.send(field)] += 1}
    maxVal = freques.key(freques.values.max)
    return self.filter(field, maxVal)
  end
end

students = [Student.new("Nikita", "Sazonov", "Vitalievych", "male", 19, 3),
  Student.new("Roman", "Goncharenko", "Kyrylovich", "male", 18, 1),
  Student.new("Maksym", "Antonenko", "Serhiovych", "male", 19, 3),
  Student.new("Nikita", "Profylenko", "Genryhovych", "male", 17, 1),
  Student.new("Borys", "Ivanchenko", "Fedorovych", "male", 21, 4),
  Student.new("Anastasya", "Yevgenovych", "Shevchuk", "female", 18, 2),
  Student.new("Daryna", "Kravchyk", "Anatolyivna", "female", 18, 2),
  Student.new("Anastasya", "Trohymenko", "Fedorivna", "female", 18, 2),
  Student.new("Larysa", "Serhienko", "Mykolaivna", "female", 17, 1),
  Student.new("Lubov", "Lysenko", "Volodymyrivna", "female", 20, 4),]

faculty = Faculty.new(students)

puts "Year with the most male percentage: ", "=====================\n"
maxY, perc = faculty.mostMaleYear()
puts "Year #{maxY} has the most % of man: #{perc * 100}"

puts "\nSurnames alphabetically: ", "=====================\n"
faculty.alphabetical(:surname).students.each {
  |s|
  puts s.surname
}

puts "\nMost common male name: ", "=====================\n"
male_name = faculty.filter(:sex, "male").mostCommon(:name).students[0].name 
puts male_name

puts "\nMost common female name: ", "=====================\n"
female_name = faculty.filter(:sex, "female").mostCommon(:name).students[0].name 
puts female_name

puts "\nNames and Surnames of most common female age: ", "=====================\n"
faculty.filter(:sex, "female").mostCommon(:age).students.each {
  |s|
  puts "#{s.name} #{s.surname}, #{s.age} y.o."
}