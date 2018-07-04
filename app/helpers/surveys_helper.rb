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
    return finalNote = (x * 20.0 / y).nan? ? 0.0 : (x * 20.0 / y).round(2)
  end

  def average(user,pages,projects,surveys)
    notes = pages.map{|page| page.rating.nil? ? 0 : page.rating} + projects.map{|project| project.rating.nil? ? 0 : project.rating} + surveys.map{|survey| getNote(matchAnswers(user,survey),survey.questions.count)}
    totalCoef = pages.map { |page| page.coefficient.nil? ? 0 : page.coefficient } + projects.map { |project| project.coefficient.nil? ? 0 : project.coefficient } + surveys.map { |survey| survey.coefficient.nil? ? 0 : survey.coefficient }

    return (notes.reduce(:+).to_f / (totalCoef.reduce(:+).to_f > 0 ? totalCoef.reduce(:+).to_f : notes.count)).round(2)
  end

end
