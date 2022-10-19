class Public::HomesController < ApplicationController
  def top
    #@items =Item.order("created_at DESC").page(params[:page]).per(4)
    @items=Item.where(is_active: true)
    @page_items=@items.order("created_at DESC").page(params[:page]).per(4)
  end

  def about
  end
end
