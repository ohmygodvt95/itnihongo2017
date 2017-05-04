class NewsfeedController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @images = current_user.newsfeed.page params[:page]
  end
end
