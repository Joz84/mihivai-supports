class CoursesController < ApplicationController
  def index
    @courses = Course.where(training_id: current_user.promotion.training_ids).order(title: :asc)
  end

  def show
    @course = Course.find(params[:id])
  end
end
