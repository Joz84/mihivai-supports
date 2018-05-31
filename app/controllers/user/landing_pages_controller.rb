class User::LandingPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_users, only: [:index, :edit]
  before_action :find_page, only: [:show, :edit, :update, :destroy]

  def index
    @landing_page = LandingPage.new
  end

  def show
    render :layout => false
  end

  def create
    @landing_page = current_user.landing_pages.new(landing_page_params)
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

  def find_page
    @landing_page = LandingPage.find(params[:id])
  end

  def landing_page_params
    params.require(:landing_page).permit(
      :title,
      :html,
      :css,
      images: [],
      landing_pages_users_attributes: [
        :id,
        :user_id,
        :_destroy
      ]
    )
  end
end
