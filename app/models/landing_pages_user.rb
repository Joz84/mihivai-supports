class LandingPagesUser < ApplicationRecord
  belongs_to :user
  belongs_to :landing_page, inverse_of: :landing_pages_users
end
