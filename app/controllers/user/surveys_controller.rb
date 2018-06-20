class User::SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
    if Survey.answered(@survey, current_user) != true
      render :show
    else
      redirect_to root_path, notice: 'You cannot access to this form.'
    end
  end

  def match
    params[:response].each do |question|
      question[1].each do |answer_id|  
        if !answer_id.blank?
          answer = Answer.find(answer_id)
          current_user.answers << answer
        end
      end
    end
    redirect_to survey_note_path
  end

  def note
    @surveys = Survey.all
  end
end
