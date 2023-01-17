class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit, :update]
  
  def index
  end
  
  def show
    @user = User.find(params[:id])
    @cosmeitems = @user.cosme_items
    # ログイン中のユーザーのお気に入りのcosme_item_idカラムを取得
    @bookmarks = Bookmark.where(user_id: current_user.id).pluck(:cosme_item_id)
    @bookmark_list = CosmeItem.find(@bookmarks)# cosme_itemsテーブルから、お気に入り登録済みのレコードを取得
  end
  
  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render 'edit'
    else
      redirect_to user_path(@user.id)
    end
  end
  
  def update
    user = current_user
    user.update(user_params)
    redirect_to user_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:last_name, :first_name, :nickname, :login_id, :profile_image, :introduction)
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.login_id == "guestuser"
      redirect_to root_path() , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end  
end
