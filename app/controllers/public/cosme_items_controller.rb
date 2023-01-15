class Public::CosmeItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update, :edit]
  
  def new
    @cosmeitem = CosmeItem.new
  end
  
  def index
    @cosmeitems = CosmeItem.all
    # @cosmeitem = CosmeItem.find(params[:id])
    # @user = @cosmeitem.user
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
  
  private
  
  def cosmeitem_params
    params.require(:cosme_item).permit(:cosme_name, :description, :image, :user_id)
  end
  
  def ensure_correct_user
    @cosmeitem = CosmeItem.find(params[:id])
    unless @cosmeitem.user == current_user
    redirect_to  cosme_item_path
    end
  end
end
