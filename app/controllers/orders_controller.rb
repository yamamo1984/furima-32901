class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]
  before_action :item_find, only: [:index, :create]
  before_action :reject_unlogined, only: [:index, :create]
  

  def index
    @order_address = OrderAddress.new
  end  

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_order
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end  


  private
  def order_params
    params.require(:order_address).permit(:post_code, :shipment_place_id, :city, :street_num, :building, :tel_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])  
  end

  def pay_order
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end     

  def item_find
    @item = Item.find(params[:item_id])
  end

  def reject_unlogined
    if current_user.id == @item.user_id then
      redirect_to root_path
    end  
  end

 

end  

