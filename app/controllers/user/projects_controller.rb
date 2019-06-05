class User::ProjectsController < ApplicationController
  before_action :set_users
  before_action :add_list_users, only: [:index, :create]
  before_action :edit_list_users, only: [:edit]

  def index
    @project = Project.new
  end

  def create
    @project = current_user.projects.new(project_params)
    @project.users << current_user
    if @project.save
      respond_to do |format|
        format.html { redirect_to user_projects_path }
        format.js  { flash.now[:alert] = "Le projet a bien été créé"}
      end
    else
      respond_to do |format|
        format.html { render :index }
        format.js  { flash.now[:alert] = "Désolé le projet n'a pu être créé"}
      end
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to user_projects_path, notice: 'Projet mis à jour avec succès'
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

  def add_list_users
    @users = User.where.not(id: current_user.id).order(:first_name)
  end

  def edit_list_users
    @users = User.all.order(:first_name)
  end

  def project_params
    params.require(:project).permit(:url, user_ids: [])
  end
end
