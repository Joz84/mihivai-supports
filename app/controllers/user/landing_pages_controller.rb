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
        format.html { redirect_to user_landing_pages_path, notice: "La page a bien été créé." }
        format.js  { flash.now[:alert] = "La page a bien été créé."}
      end

    else
      respond_to do |format|
        format.html { redirect_to user_landing_pages_path, notice: "Désolé la page n'a pas pu être créé : formulaire incomplet ou mal rempli." }
        format.js  { flash.now[:alert] = "Désolé la page n'a pas pu être créé : formulaire incomplet ou mal rempli."}
      end
    end
  end

  def edit
    respond_to do |format|
      format.html { render :edit }
      format.js
    end
  end

  def update
    if @landing_page.update_attributes(landing_page_params)
      respond_to do |format|
        format.html { redirect_to user_landing_pages_path, notice: "La page a été mise à jour."}
        format.js
      end
    else
      render :edit
    end
  end

  def destroy
    @landing_page.delete
    flash[:notice] = "La page a bien été supprimée"
    redirect_to user_landing_pages_path
  end

  def delete_image_attachment
    @image = ActiveStorage::Blob.find_signed(params[:id])
    @image.purge

    respond_to do |format|
      format.js { render action: :delete_image_attachment}
    end
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

  def find_page
    @landing_page = LandingPage.find(params[:id])
  end

  def landing_page_params
    params.require(:landing_page).permit(:title, :html, :css, images: [], user_ids: [])
  end
end
