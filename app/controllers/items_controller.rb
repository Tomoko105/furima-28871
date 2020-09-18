class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :select, only: [:show, :edit, :update, :destroy]
  before_action :user_check, only: [:update, :edit, :destroy]
  def index
    @items = Item.all.order('created_at DESC')
  end

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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path if @item.valid?
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def select
    @item = Item.find(params[:id])
  end

  def user_check
    user_signed_in? && current_user.id == @item.user_id
  end

  def item_params
    params.require(:item).permit(:image, :name, :explation, :price, :category_id, :status_id, :burden_id, :pref_id, :ship_id).merge(user_id: current_user.id)
  end
end
