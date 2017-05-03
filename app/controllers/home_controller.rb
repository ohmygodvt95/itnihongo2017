class HomeController < ApplicationController
  def index
    @images = Image.all.order(id: :desc).page params[:page]
  end
end
