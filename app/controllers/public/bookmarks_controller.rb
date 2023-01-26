class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @bookmarks = Bookmark.where(user_id: current_user.id)
    @bookmarks = @bookmarks.page(params[:page]).per(6)
  end
  
  def create
    @cosmeitem = CosmeItem.find(params[:cosme_item_id])
    if @cosmeitem.user_id != current_user.id  # 自分の投稿以外にお気に入り登録が可能
      @bookmark = Bookmark.create(user_id: current_user.id, cosme_item_id: @cosmeitem.id)
    end
  end
  
  def destroy
    @cosmeitem = CosmeItem.find(params[:cosme_item_id])
    @bookmark = Bookmark.find_by(user_id: current_user.id, cosme_item_id: @cosmeitem.id)
    @bookmark.destroy
  end
end
