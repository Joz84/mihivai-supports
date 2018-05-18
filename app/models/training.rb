class Training < ApplicationRecord
  has_many :promotions_trainings
  has_many :promotions, through: :promotions_trainings
  has_many :courses
end
