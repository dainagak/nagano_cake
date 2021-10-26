class Public::ItemsController < ApplicationController

 def index
  @genres = Genre.all
  #gem ransack未実装
  # @search = Item.ransack(params[:q])
  # @items = @search.result.page(params[:page]).per(8)
  @items_all = Item.all
 end


 def show
  @item = Item.find(params[:id])
  @cart_item = CartItem.new
  @genres = Genre.all
 end

end
