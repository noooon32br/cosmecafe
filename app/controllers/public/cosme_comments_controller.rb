class Public::CosmeCommentsController < ApplicationController
    
  def create
    cosme_item = CosmeItem.find(params[:cosme_item_id])
    comment = current_user.cosme_comments.new(cosme_comment_params)
    comment.cosme_item_id = cosme_item.id
    comment.save
    redirect_to cosme_item_path(cosme_item.id)
  end
  
  def destroy
    CosmeComment.find(params[:id]).destroy
    redirect_to cosme_item_path(params[:cosme_item_id])
  end

  private

  def cosme_comment_params
    params.require(:cosme_comment).permit(:comment)
  end

end
