class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  has_and_belongs_to_many :landing_pages
  has_and_belongs_to_many :projects

  belongs_to :promotion



  validates :promotion, presence: true

  def full_name
    return email if first_name.nil? || last_name.nil?
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

end
