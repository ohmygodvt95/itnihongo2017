class RelationshipsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :find_user_follow, only: [:create]
  before_action :find_user_unfollow, only: [:destroy]

  def create
    current_user.follow @user
    flash[:success] = "You are follow #{@user.username}"
    redirect_to @user
  end

  def destroy
    current_user.unfollow @user
    flash[:success] = "You are unfollow #{@user.username}"
    redirect_to @user
  end

  protected
  def find_user_follow
    @user = User.find_by id: params[:followed_id]
    unless @user
      flash[:error] = "ユーザーは存在しません"
      redirect_to root_path
    end
  end

  def find_user_unfollow
    @user = Relationship.find_by(id: params[:id]).followed
    unless @user
      flash[:error] = "ユーザーは存在しません"
      redirect_to root_path
    end
  end
end
