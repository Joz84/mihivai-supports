class User::SurveysController < ApplicationController
  def index
    if current_user.admin?
      redirect_to admin_surveys_path
    elsif Survey.all.all?{ |s| s.hidden == true }
      redirect_to root_path
    else
      @surveys = Survey.all
      render :index
    end
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