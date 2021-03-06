class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :user_check, only: [:edit, :update]
  def index
    @items = Item.all.order("created_at DESC")
  end  

  def new
    @item = Item.new
  end  

   
  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to item_path(@item.id)
    else  
      render :new
    end   
  end

  def show
  end  

  def edit
    binding.pry
  end  

  def update
    @item.update(item_params)
    if @item.update(item_params)
      redirect_to item_path(@item.id)
   else  
      render :edit
   end   
 end  


  private

  def item_params
    params.require(:item).permit(:name, :price, :detail, :condition_id, :shipping_fee_id, :shipment_place_id, :shipment_date_id, :category_id, :image).merge(user_id: current_user.id)
  end  

  def set_item
    @item = Item.find(params[:id])
  end  

  def user_check
    unless current_user.id == @item.user_id then
      redirect_to root_path
    end  
  end  

end
