class Public::CosmeItemsController < ApplicationController
  def new
    @cosmeitem = CosmeItem.new
  end
  
  def index
    @cosmeitems = CosmeItem.all
  end
  
  def show
    @cosmeitem = CosmeItem.find(params[:id])
  end
  
  def create
    cosmeitem = CosmeItem.new(cosmeitem_params)
    cosmeitem.save
    redirect_to cosme_items_path
  end
  
  def edit
    @cosmeitem = CosmeItem.find(params[:id])
  end
  
  def update
    cosmeitem = CosmeItem.find(params[:id])
    cosmeitem.update(cosmeitem_params)
    redirect_to cosme_item_path(cosmeitem.id)
  end
  
  def destroy
    cosmeitem = CosmeItem.find(params[:id])
    cosmeitem.destroy
    redirect_to cosme_items_path
  end
  
  private
  
  def cosmeitem_params
    params.require(:cosme_item).permit(:cosme_name, :description)
  end
end
