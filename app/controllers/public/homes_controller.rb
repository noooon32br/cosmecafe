class Public::HomesController < ApplicationController
  def top
    @cosmeitem = CosmeItem.last(4)
  end
end
