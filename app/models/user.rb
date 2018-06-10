class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  has_many :projects_users
  has_many :landing_pages_users
  has_many :projects,       through: :projects_users
  has_many :landing_pages,  through: :landing_pages_users
  belongs_to :promotion

  validates :promotion, presence: true

  def full_name
    return email if first_name.nil? || last_name.nil?
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

end
