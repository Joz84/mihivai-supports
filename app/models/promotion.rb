class Promotion < ApplicationRecord
  belongs_to :school
  has_many :users
  has_many :promotions_trainings
  has_many :trainings, through: :promotions_trainings
end
