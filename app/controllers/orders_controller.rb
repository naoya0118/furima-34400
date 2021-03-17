class OrdersController < ApplicationController

  before_action :find_item, only: [:index, :create]
  before_action :contributor_confirmation, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @order_delivery = OrderDelivery.new
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
       pay_item
       @order_delivery.save
       redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_delivery).permit(:postal_code, :delivery_area_id, :municipality, :address, :building, :phone_number, :address).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def contributor_confirmation
    redirect_to root_path if (current_user == @item.user) || (@item.order.present?)
  end
end