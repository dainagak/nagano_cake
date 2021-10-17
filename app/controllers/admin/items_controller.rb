class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new(item_params)
      @item.save
    redirect_to admin_item_path
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

end
