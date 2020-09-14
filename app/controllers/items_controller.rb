class ItemsController < ApplicationController
  before_action :move_to_new, except:[:index]
  def index
  end

  #before_action :authenticate_user!

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explation, :price, :fee, :category_id, :status_id, :burden_id, :pref_id, :ship_id).merge(user_id: current_user.id)
  end
  def move_to_new
    authenticate_user!
  end
end

