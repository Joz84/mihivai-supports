class Training < ApplicationRecord
  belongs_to :promotion
  has_many :training_courses
  has_many :courses, through: :training_courses
end
