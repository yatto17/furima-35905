class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @purchase_order = PurchaseOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_order = PurchaseOrder.new(order_params)
    if @purchase_order.valid?
      @purchase_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def order_params
    params.require(:purchase_order).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
