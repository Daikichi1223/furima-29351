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
      render 'index'
    end
  end

  private

  def order_params
    item = Item.find(params[:item_id])
    params.require(:order_address).permit(:postal_code, :exhibitor_area_id, :city, :address, :building_name, :phone_number, :token).merge(user_id: current_user.id, item_id: item.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_66c9146405da51aa5744d48e"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end