class Public::CosmeItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update, :edit]
  
  def new
    @cosmeitem = CosmeItem.new
  end
  
  def index
    @rank = params[:rank]
    if @rank.present?
      if @rank == '閲覧数'
        @cosmeitems = CosmeItem.all.order(views: 'desc')
      elsif @rank == '新着順'
        @cosmeitems = CosmeItem.all.order(created_at: 'desc')
      end
    else
      @cosmeitems = CosmeItem.all.order(created_at: 'desc')
      # @cosmeitems = CosmeItem.last(6)
    end
    
  end
  
  def show
    @cosmeitem = CosmeItem.find(params[:id])
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
