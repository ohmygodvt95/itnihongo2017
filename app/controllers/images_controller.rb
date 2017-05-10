class ImagesController < ApplicationController
  before_action :find_image, only: [:show, :edit, :update, :destroy]

  def create
    image = Image.new new_image_params
    if image.save
      flash[:success] = "画像がアップロードされました"
      redirect_to image
    else
      flash[:error] = "Error when create image"
      redirect_back
    end
  end

  def show
    @comments = @image.comments.page params[:page]
  end

  def edit

  end

  def update
    if @image.update_attributes update_image_params
      flash[:success] = "画像が破壊されました"
      redirect_to @image
    else
      flash[:error] = "イメージは破壊できません"
      redirect_back
    end
  end

  def destroy
    if @image.destroy
      flash[:success] = "画像が破壊されました"
      redirect_to root_path
    else
      flash[:error] = "イメージは破壊できません"
      redirect_back
    end
  end

  protected
  def new_image_params
    params.require(:image).permit :user_id, :file, :body
  end

  def update_image_params
    params.require(:image).permit :user_id, :file, :body
  end

  def find_image
    @image = Image.find_by id: params[:id]
    unless @image
      flash[:error] = "写真がありません"
      redirect_to root_path
    end
  end
end
