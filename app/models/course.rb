class Course < ApplicationRecord
  has_many :training_courses
  has_many :trainings, through: :training_courses
end
