class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :find_image, only: [:create, :destroy]

  def create
    @image.comments.new new_comment_params
    if @image.save
      flash[:success] = "コメントした"
    else
      flash[:error] = "コメントできません"
    end
    redirect_to @image
  end

  def destroy
    comment = @image.comments.find_by id: params[:id]
    if comment.destroy
      flash[:success] = "コメントが削除されました"
    else
      flash[:error] = "コメントは削除できません"
    end
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

  def new_comment_params
    params.require(:comment).permit :user_id, :body
  end
end
