class LandingPagesUser < ApplicationRecord
  belongs_to :user
  belongs_to :landing_page
end
