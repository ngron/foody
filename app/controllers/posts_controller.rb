class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿しました"
      redirect_to root_url
    else
      flash.now[:danger] = "投稿できませんでした"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    
    if @post.update(post_params)
      flash[:success] = "投稿を更新しました"
      redirect_to root_url
    else
      flash[:danger] = "更新できませんでした"
      render :edit
    end
  end

  def destroy
  end
  
  private
  
  def post_params
    params.require(:post).permit(:photo, :title, :photo_cache, :remove_photo, :description, :price)
  end
end
