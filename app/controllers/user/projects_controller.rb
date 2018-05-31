class User::ProjectsController < ApplicationController
  before_action :set_users

  def index
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      respond_to do |format|
        format.html { redirect_to user_projects_path }
        format.js  { flash.now[:alert] = nil}
      end
    else
      respond_to do |format|
        format.html { render :index }
        format.js  { flash.now[:alert] = "Désolé le project n'a pu être créé"}
      end
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to user_projects_path, notice: 'Porject mis à jour avec succès'
    else
      render :edit
    end
  end


  def destroy
  end

  private

  def set_users
    @users = User.where(promotion: current_user.promotion)
  end

  def project_params
    params.require(:project).permit(
      :url,
      projects_users_attributes: [
        :id,
        :user_id,
        :_destroy
      ]
    )
  end
end
