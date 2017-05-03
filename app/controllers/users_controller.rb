class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def show
    @images = @user.images.order(id: :desc).page params[:page]
  end

  protected
  def find_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:error] = "User does not exist"
      redirect_to root_path
    end
  end
end
