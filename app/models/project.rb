class Project < ApplicationRecord
  has_and_belongs_to_many :users

  validates :url, presence: true
  # accepts_nested_attributes_for :projects_users,
  #                               reject_if: proc { |attributes| attributes[:user_id].blank? },
  #                               allow_destroy: true

  def metas
    MetaInspector.new(url)
  rescue => e
    errors.add(:base, e.message)
    false
  end


end
