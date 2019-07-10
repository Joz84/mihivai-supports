class Admin::LandingPagesController < ApplicationController
  def index
    redirect_to lab_path unless current_user.admin
    if params[:search].nil? || search_params[:promotion_id].empty?
      @promotion = nil
      @landing_pages = LandingPage.all
    else
      @promotion = Promotion.find(search_params[:promotion_id])
      @landing_pages = LandingPage.includes(:users).where(users: {promotion: @promotion})
    end
  end

  def update
    @landing_page = LandingPage.find(params[:id])
    if @landing_page.update(landing_page_params)
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

  def landing_page_params
    params.require(:landing_page).permit(:rating)
  end
end
