class User::ProjectsController < ApplicationController
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




  def update
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(
      :url,
      projects_users_attributes: [
        :id,
        :user,
        :_destroy
      ]
    )
  end
end


