class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :lab, :legal]

  def home
  end

  def lab
  end

  def legal
  end
end
