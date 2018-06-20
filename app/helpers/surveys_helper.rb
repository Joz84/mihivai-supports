module SurveysHelper

  def matchAnswers(user, survey)
    x = 0
    survey.questions.each do |question|
      q = question.answers.where(right: true)
      u = user.answers.where(question_id: question)
      if q == u
        x += 1
      end
    end
    return x
  end

  def getNote(x,y)
    return finalNote = (x * 20.0 / y).nan? ? "0.0" : (x * 20.0 / y).round(2)
  end

end
