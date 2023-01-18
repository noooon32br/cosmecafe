class Public::CosmeItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update, :edit]
  
  def new
    @cosmeitem = CosmeItem.new
    @cosme_categories = CosmeCategory.find_by(id: params[:category_id])
  end
  
  def index
    @cosme_categories = CosmeCategory.where(ancestry: nil)
    @cosmeitems = CosmeItem.all.order(created_at: 'desc')
    if params[:category_id].present?
      category = CosmeCategory.find_by(id: params[:category_id])
      if category.present?
        @cosmeitems = category.cosme_items.order(created_at: 'desc')
      end
    end
    
    if params[:rank].present?
      if params[:rank] == '閲覧数'
        @cosmeitems = @cosmeitems.order(views: 'desc')
      end
    end
    # @cosmeitems = @cosmeitems.page(params[:page]).per(6)
  end
  
  def show
    @cosmeitem = CosmeItem.find(params[:id])
    @cosmeitem.update!(views: @cosmeitem.views + 1)
    @cosme_comment = CosmeComment.new
  end
  
  def create
    @cosmeitem = CosmeItem.new(cosmeitem_params)
    @cosmeitem.user_id = current_user.id
    @cosmeitem.save!
    redirect_to cosme_items_path(), notice: "投稿しました"
    # else
    #   @cosmeitem = CosmeItem.all
    #   render 'index'
    # end
  end
  
  def edit
    @cosmeitem = CosmeItem.find(params[:id])
  end
  
  def update
    @cosmeitem = CosmeItem.find(params[:id])
    @cosmeitem.update(cosmeitem_params)
    redirect_to cosme_item_path(@cosmeitem.id)
  end
  
  def destroy
    cosmeitem = CosmeItem.find(params[:id])
    cosmeitem.destroy
    redirect_to cosme_items_path
  end
  
  def hashtag
    @user = current_user
    if params[:name].nil?
      @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.cosme_items.count}
    else
      @hashtag = Hashtag.find_by(hashname: params[:name])
      @cosmeitems = @hashtag.cosme_items
      @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.cosme_items.count}
    end
  end
  
  
  private
  
  def cosmeitem_params
    params.require(:cosme_item).permit(:cosme_name, :description, :image, :user_id, :hashbody, hashtag_ids: [])
  end
  
  def ensure_correct_user
    @cosmeitem = CosmeItem.find(params[:id])
    unless @cosmeitem.user == current_user
    redirect_to  cosme_item_path
    end
  end
end
