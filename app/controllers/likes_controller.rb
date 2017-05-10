class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :find_image, only: [:create, :destroy]

  def create
     unless current_user.like_image? @image
       current_user.like @image
     end
     flash[:success] = "あなたはイメージが好きです"
     redirect_to @image
  end

  def destroy
    if current_user.like_image? @image
      current_user.unlike @image
    end
    flash[:success] = "あなたはイメージが好きではありません"
    redirect_to @image
  end

  protected
  def find_image
    @image = Image.find_by id: params[:image_id]
    unless @image
      flash[:error] = "写真がありません"
      redirect_to root_path
    end
  end
end
