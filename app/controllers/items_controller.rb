class ItemsController < ApplicationController
  def index
  end  

  def new
    @item = Item.new
  end  

   
  def create
    Item.create(item_params)
  end  

  private

  def item_params
    params.require(:item).permit(:name, :price, :detail, :condition_id, :shipping_fee_id, :shipment_place_id, :shipment_date_id, :category_id, :image).merge(user_id: current_user.id)
  end  
end
