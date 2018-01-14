class ToppagesController < ApplicationController
  def index
    @posts = Post.all.order("updated_at DESC").page(params[:page]).per(10)
  end
end
