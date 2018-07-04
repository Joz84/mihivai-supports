class Survey < ApplicationRecord
  has_many :questions, inverse_of: :survey
  has_many :answers, through: :questions
  validates :title, :timer, presence: true

  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true

  def self.answered(survey, user)
    user.answers.each do |answer|
      if (survey.id == answer.question.survey_id || survey.questions.empty?) && !user.admin?  #si tu as déjà répondu au formulaire et que tu n'es pas admin
        return true
      end
    end
  end
end
