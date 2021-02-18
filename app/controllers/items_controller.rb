class ItemsController < ApplicationController
  def index
    @item = Item.all
  end  

  def new
    @item = Item.new
  end  

   
  def create
    @item = Item.new(item_params)
    if @item.save!
       redirect_to items_path(@item)
    else  
      render :new
    end   
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :detail, :condition_id, :shipping_fee_id, :shipment_place_id, :shipment_date_id, :category_id, :image).merge(user_id: current_user.id)
  end  
end
