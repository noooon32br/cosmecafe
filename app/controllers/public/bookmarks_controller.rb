class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end
  
  def create
    @cosme_item = CosmeItem.find(params[:cosme_item_id])
    if @cosme.user_id != current_user.id  # 自分の投稿以外にお気に入り登録が可能
      @bookmark = Bookmark.create(user_id: current_user.id, cosme_item_id: @cosme_item.id)
    end
  end
  
  def destroy
    @cosme_item = CosmeItem.find(params[:cosme_item_id])
    @bookmark = Bookmark.find_by(user_id: current_user.id, cosme_item_id: @cosme_item.id)
    @bookmark.destroy
  end
end
