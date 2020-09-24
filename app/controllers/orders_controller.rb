class OrdersController < ApplicationController
before_action :authenticate_user!
  def index
    unless user_signed_in? && current_user.id == params[:item_id]
      redirect_to root_path
    end
    @item = Item.find(params[:item_id])
  end

  def create
  end
end