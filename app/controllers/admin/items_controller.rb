class Admin::ItemsController < ApplicationController
  def index
  end

  def show
   @item=Item.find(params[:id])
  end

  def edit
  end

  def new
   @item=Item.new
  end

  def create
   @item=Item.new(item_params)
     @item.save
     redirect_to admin_item_path(@item.id)
    # else
    #  render :new
    # end
  end

  private
  def item_params
    params.require(:item).permit(:genre_id,:name,:introduction,:price,:is_active,:get_image)
  end

end
