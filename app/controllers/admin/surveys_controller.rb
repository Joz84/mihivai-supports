class Admin::SurveysController < ApplicationController
  def index
    redirect_to root_path unless current_user.admin
    @surveys = Survey.all
  end

  def new
    if !current_user.admin?
      redirect_to user_surveys_path, notice: "You don't have the rights to access this page."
    else
      @survey = Survey.new
    end
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      flash[:notice] = 'Successfully created form.'
      redirect_to admin_surveys_path
    else
      render :new
    end
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(survey_params)
      redirect_to admin_surveys_path, notice: 'Successfully updated form'
    else
      render :edit
    end
  end

  def edit
    if !current_user.admin?
      redirect_to user_surveys_path, notice: "You don't have the rights to access this page."
    else
      @survey = Survey.find(params[:id])
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to admin_surveys_path, notice: 'Form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :timer, :hidden, :coefficient, questions_attributes: [:id, :title, :_destroy, answers_attributes:[:id, :title, :right, :_destroy]])
  end
end
