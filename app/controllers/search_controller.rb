class SearchController < ApplicationController
  def index
    @q = Image.ransack(params[:q])
    @images = @q.result.page(params[:page]).to_a.uniq
  end
end
