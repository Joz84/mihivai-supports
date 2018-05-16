class CoursesController < ApplicationController
  def index
    @courses = Course.all.order(title: :asc)
  end

  def show
    @course = Course.find(params[:id])
  end
end
