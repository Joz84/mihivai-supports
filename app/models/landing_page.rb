class LandingPage < ApplicationRecord
  has_many :landing_pages_users, inverse_of: :landing_page
  has_many :users, through: :landing_pages_users
  validates :html, :title, presence: true
  validates :title, uniqueness: true
  accepts_nested_attributes_for :landing_pages_users,
                                reject_if: proc { |attributes| attributes[:user_id].blank? },
                                allow_destroy: true
end
