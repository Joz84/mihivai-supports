class School < ApplicationRecord
  has_many :promotions
  has_many :users, through: :promotions
  has_many :projects, through: :users
end
