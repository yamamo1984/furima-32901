class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end  

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_order
      @order_address.save
      redirect_to action: :index
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
end  

