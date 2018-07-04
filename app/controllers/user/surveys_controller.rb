class User::SurveysController < ApplicationController
  def index
    if current_user.admin?
      redirect_to admin_surveys_path
    elsif Survey.all.all?{ |s| s.hidden }
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
    answer_ids = params[:response].values.flatten
    current_user.add_answers(answer_ids)
    redirect_to survey_note_path
  end

  def note
    @surveys = Survey.all

    if params[:search].nil? || search_params[:user_id].empty?
      @users = User.all
    else
      @users = [User.find(search_params[:user_id])]
    end


  end

  private

  def search_params
    params.require(:search).permit(:user_id)
  end
end
