class FollowingController < ApplicationController
  before_action :find_user, only: [:index]

  def index
    @users = @user.following.page params[:page]
  end

  protected
  def find_user
    @user = User.find_by id: params[:user_id]
    unless @user
      flash[:error] = "ユーザーは存在しません"
      redirect_to root_path
    end
  end
end
