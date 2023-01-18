class Admin::HomesController < ApplicationController
  def top
    @users = User.all
    @cosmeitems = CosmeItem.all
  end
end
