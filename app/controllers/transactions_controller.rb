class TransactionsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @transaction = BuyInfo.new(transaction_params)
  end

  private
  
  def transaction_params
   params.require(:buy_info).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number)
  end
end
