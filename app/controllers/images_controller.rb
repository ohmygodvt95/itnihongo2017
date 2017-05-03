class ImagesController < ApplicationController
  before_action :find_image, only: [:show, :edit, :update, :destroy]

  def create
    image = Image.new new_image_params
    if image.save
      flash[:success] = "Image has been uploaded"
      redirect_to image
    else
      flash[:error] = "Error when create image"
      redirect_back
    end
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  protected
  def new_image_params
    params.require(:image).permit :user_id, :file, :body
  end

  def find_image
    @image = Image.find_by id: params[:id]
    unless @image
      flash[:error] = "Image does not exist"
      redirect_to root_path
    end
  end
end
