class ProjectsUser < ApplicationRecord
  belongs_to :project, inverse_of: :projects_users
  belongs_to :user
end
