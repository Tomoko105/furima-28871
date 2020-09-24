class ConsumersController < ApplicationController
  before_action :authenticate_user!
  before_action :select
  def index
    @consumer = ConsumerUserItem.new
  end

  def create
    @consumer = ConsumerUserItem.new(consumer_params)

    if @consumer.valid?
      pay_item
      @consumer.save
      redirect_to root_path
    else
      render 'index'
  end
  end

  private

  def select
    @item = Item.find(params[:item_id])
  end

  def consumer_params
    params.require(:consumer_user_item).permit(:postalcode, :pref_id, :city, :address, :buldname, :tel, :token).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: consumer_params[:token],
      currency: 'jpy'
    )
  end
end
