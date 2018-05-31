class User::LandingPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_users, only: [:index, :edit]
  before_action :find_page, only: [:show, :edit, :update, :destroy]
  before_action :add_list_users, only: [:index, :create]
  before_action :edit_list_users, only: [:edit]


  def index
    @landing_page = LandingPage.new
  end

  def show
    render :layout => false
  end

  def create
    @landing_page = current_user.landing_pages.new(landing_page_params)
    @landing_page.users << current_user

    if @landing_page.save
      respond_to do |format|
        format.html { redirect_to user_landing_pages_path }
        format.js  { flash.now[:alert] = nil}
      end
    else
      respond_to do |format|
        format.html { render :index }
        format.js  { flash.now[:alert] = "Désolé la page n'a pas pu être créée"}
      end
    end
  end

  def edit
  end

  def update

    if @landing_page.update_attributes(landing_page_params)
      redirect_to user_landing_pages_path, notice: "La page a été mise à jour"
    else
      render :edit
    end
  end

  def destroy
    @landing_page.delete
    flash[:notice] = "La page a bien été supprimé"
    redirect_to user_landing_pages_path
  end

  private

  def set_users
    @users = User.where(promotion: current_user.promotion)
  end

  def add_list_users
    @users = User.all.order(:first_name).reject { |s| s.id == current_user.id }.map{ |user| [user.full_name, user.id] }
  end

  def edit_list_users
    @users = User.all.order(:first_name).map{ |user| [user.full_name, user.id] }
  end

  def find_page
    @landing_page = LandingPage.find(params[:id])
  end

  def landing_page_params
    params.require(:landing_page).permit(:title, :html, :css, images: [], user_ids: [])
  end
end
