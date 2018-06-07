class Admin::ProjectsController < ApplicationController
  def index
    redirect_to root_path unless current_user.admin
    if params[:search].nil? || search_params[:promotion_id].empty?
      @promotion = nil
      @projects = Project.all
    else
      @promotion = Promotion.find(search_params[:promotion_id])
      @projects = Project.includes(:users).where(users: {promotion: @promotion})
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      respond_to do |format|
        format.html { redirect_to admin_projects_path}
        format.js
      end
    end
  end

  private

  def search_params
    params.require(:search).permit(:promotion_id)
  end

  def project_params
    params.require(:project).permit(:rating)
  end
end
