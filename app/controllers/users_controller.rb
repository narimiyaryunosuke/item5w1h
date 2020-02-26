class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  
  def show
    @user = User.find(params[:id])
    @items = @user.items
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    if current_user == @user
      
      if @user.update(user_params)
        flash[:success] = "ユーザー情報を編集しました。"
        redirect_to @user
      else
        flash[:danger] = "ユーザー情報の編集に失敗しました。"
        render :edit
      end
      
    else
      redirect_to root_url
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :image)
  end
end
