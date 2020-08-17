class TransactionsController < ApplicationController
  before_action :transition, only: :index
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @transaction = BuyInfo.new(transaction_params)
    if @transaction.valid?
      pay_item
      @transaction.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def transaction_params
   params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency:'jpy'
    )
  end

  def transition
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id || @item.buy != nil
      redirect_to  item_path(@item.id)
    else
      render :index
    end
  end
end
