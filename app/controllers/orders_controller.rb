class OrdersController < ApplicationController

  def new
    @item = Item.new
  end  
  
  def index
    @item = Item.find(params[:format])
  end  



  def create
    @order = Order.new(order_params)
    if @order.save
      return redirect_to root_path      
    else
      render 'index'
    end  
  end

end  

