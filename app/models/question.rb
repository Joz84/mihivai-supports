class Question < ApplicationRecord
  has_many :answers, inverse_of: :question
  belongs_to :survey, inverse_of: :questions
  validates :title, presence: true

  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
end
