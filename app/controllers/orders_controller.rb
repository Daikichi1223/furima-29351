class OrdersController < ApplicationController
before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
    @order = Order.new(
      postal_code: order_params[:postal_code], 
      exhibitor_area_id: order_params[:exhibitor_area_id],
      city: order_params[:city],
      adress: order_params[:adress],
      building_name: order_params[:building_name],
      phone_number: order_params[:phone_number]
    )
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:postal_code, :exhibitor_area_id, :city, :adress, :building_name, :phone_number, :token)
  end

  def pay_item
    Payjp.api_key = "sk_test_66c9146405da51aa5744d48e"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:postal_code],
      amount: order_params[:exhibitor_area_id],
      amount: order_params[:city],
      amount: order_params[:adress],
      amount: order_params[:building_name],
      amount: order_params[:phone_number],
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end