class Public::SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @range = params[:range]
    if @range == "会員"
      @users = User.looks(params[:word])
    else
      @cosmeitems = CosmeItem.looks(params[:word])
    end
  end  
end
