class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]
  
  def show
    @user = User.find(params[:id])
    @cosme_items = @user.cosme_items
  end
  
  def edit
  end
  
  def update
    user = current_user
    user.update(user_params)
    redirect_to user_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:last_name, :first_name, :nickname, :login_id, :profile_image)
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.login_id == "guestuser"
      redirect_to root_path() , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end  
end
