class Project < ApplicationRecord
  has_many :projects_users, inverse_of: :project
  has_many :users, through: :projects_users
  validates :url, presence: true
  accepts_nested_attributes_for :projects_users,
                                reject_if: proc { |attributes| attributes[:user].blank? },
                                allow_destroy: true

end
