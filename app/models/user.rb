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
  has_and_belongs_to_many :answers

  belongs_to :promotion

  validates :promotion, presence: true

  def name
    return email if first_name.nil? || last_name.nil?
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def initials
    return "#{email.chr.upcase}@" if first_name.nil? || last_name.nil?
    "#{first_name.chr.upcase} #{last_name.chr.upcase}"
  end

  def add_answers(answer_ids)
    answer_ids.each do |answer_id|
      answers << Answer.find(answer_id) unless answer_id.blank?
    end
  end
end
