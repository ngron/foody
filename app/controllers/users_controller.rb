class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    counts(@user)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "登録しました"
      redirect_to root_url
    else
      flash.now[:danger] = "ユーザの登録に失敗しました。"
      render :new
    end
  end
  
  def mylist
    @user = User.find(params[:id])
    @posts = current_user.posts.all.page(params[:page])
    counts(@user)
  end
  
  # notice辞めてshowだけで十分な気がしてきた
  def notice
  end
  
  private 
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

