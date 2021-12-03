class Student < ApplicationRecord
  validates :name, presence: true
  validates :surname, presence: true
  validates :middlename, presence: true
  validates :gender, presence: true
  validates :age, presence: true
  validates :year, presence: true
end
