class PaysController < ApplicationController
  before_action :authenticate_user!, except: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :redirect, only: [:index, :create]

  def index
    @item  = Item.find(params[:item_id])
    @users_item_pay = UsersItemPay.new
  end

  def create
    @item  = Item.find(params[:item_id])
    @users_item_pay = UsersItemPay.new(pay_params)
    if @users_item_pay.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: pay_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @users_item_pay.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect
    if @item.user_id == current_user.id || @item.users_item != nil
       redirect_to root_path
    end
  end

  private

  def pay_params
    params.require(:users_item_pay).permit(:post_code, :prifecture_id, :city, :address, :building, :tel).merge(user_id: current_user.id, item_id: @item[:id],token: params[:token])
  end

end
