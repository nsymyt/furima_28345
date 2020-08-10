class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
  end

  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :days_until_shipping, :price).merge(user_id: current_user.id)
  end

end
