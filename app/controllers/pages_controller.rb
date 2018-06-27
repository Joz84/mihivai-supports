class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def admin
    redirect to root_path unless current_user.admin?
  end
end
