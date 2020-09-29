class OrdersController < ApplicationController
before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end

    @orderaddress = OrderAddress.new
  
  end

  def create
    @item = Item.find(params[:item_id])
    @orderaddress = OrderAddress.new(order_params)
    if @orderaddress.valid?
      pay_item
      @orderaddress.save
      return redirect_to root_path
    else
      redirect_to item_orders_path
    end
  end

  private

  def order_params
    item = Item.find(params[:item_id])
    params.require(:order_address).permit(:postal_code, :exhibitor_area_id, :city, :address, :building_name, :phone_number, :token).merge(user_id: current_user.id, item_id: item.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],    
      currency:'jpy'                 
    )
  end

end