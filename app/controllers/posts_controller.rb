class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    # コメントを作成
    @comment = current_user.comments.build
    # 表示させるコメント
    @comments = Comment.all
  end
  
  def new
    # 投稿を作成
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
  
   # コメントを保存
  def comment
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post_id = @post.id

    if @comment.save
      flash[:success] = "コメントしました"
       redirect_to @post
    else
      # レンダリングしたときに値がなくなるのを防ぐ
      @comments = Comment.all
      
      flash.now[:success] = "コメントできませんでした"
      render :show
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
    @post = Post.find(params[:id])
    @post.destroy
    
    flash[:success] = "投稿を削除しました"
    redirect_to mylist_user_path(current_user)
  end
    
  private
  
  def post_params
    params.require(:post).permit(:photo, :title, :photo_cache, :remove_photo, :description, :price)
  end
  
  def comment_params
    params.require(:comment).permit(:content)
  end
end
