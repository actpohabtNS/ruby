class Student < ApplicationRecord
  validates :surname, presence: true
  validates :experience, presence: true
  validates :teaching_experience, presence: true
  validates :school, presence: true
  validates :second_language, presence: true
end
