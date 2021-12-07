class Contact
  attr_reader :name
  attr_reader :phone

  def initialize(name, phone)
    @name = name
    @phone = phone
  end

  def toString
    return "#{name} #{phone}"
  end
end

class SocialMediaAccount < Contact
  def initialize(name, phone, nickname)
    @nickname = nickname
    super(name, phone)
  end

  def toString
    return "#{@nickname}: #{name} #{phone}"
  end
end

class Email < Contact
  def initialize(name, phone, email)
    @email = email
    super(name, phone)
  end

  def toString
    return "#{@email}: #{name} #{phone}"
  end
end

class Contacts
  attr_reader :contacts

  def initialize(contacts)
    @contacts = contacts
  end

  def filter(field, value)
    return Contacts.new(@contacts.select { |c| c.send(field) == value })
  end

  def filterContains(field, value)
    return Contacts.new(@contacts.select { |c| c.send(field).include?(value) })
  end

  def contains(value)
    return Contacts.new(@contacts.select { |c| c.toString().include?(value) })
  end

  def sortByField(field)
    return Contacts.new(@contacts.sort { |s1, s2| s1.send(field) <=> s2.send(field) })
  end
end

cs = [
  Contact.new("Nikita", "0980357133"),
  Contact.new("Valeriana", "0964213150"),
  SocialMediaAccount.new("Stepan", "0957209711", "Ste4ani0"),
  SocialMediaAccount.new("Tetyana", "0961650974", "Fufar4ik"),
  Email.new("Maksym", "0961234567", "bestteacher@gmail.com"),
  Email.new("Afrodita", "0696969696", "bestgirl@cigarettecams.com")
]

contacts = Contacts.new(cs)

puts "\nNames alphabetically: ", "=====================\n"
contacts.sortByField(:name).contacts.each {
  |c|
  puts c.name
}

puts "\nNames containing 'an': ", "=====================\n"
contacts.contains("an").contacts.each {
  |c|
  puts c.toString()
}

puts "\nNames containing 'i' with Kyivstar (096) number: ", "=====================\n"
contacts.filterContains(:name, "i").contains('096').contacts.each {
  |c|
  puts c.toString()
}
