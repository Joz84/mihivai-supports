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

  validates :conditions_validation, inclusion: { in: [true] }

  def name
    return email if first_name.nil? || last_name.nil?
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def initials
    return "#{email.chr.upcase}@" if first_name.nil? || last_name.nil?
    "#{first_name.chr.upcase} #{last_name.chr.upcase}"
  end

end
