class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_path, only: [:edit, :update]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
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
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.user == current_user
       @item.destroy
    else
      redirect_to root_path   
    end
  end
  
  private
  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_to_path
    if @item.user != current_user || @item.users_item != nil
            redirect_to  root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :status_id, :delivery_charge_id, 
                                 :prifecture_id, :shipping_day_id, :price, :image).merge(user_id:current_user.id)
  end




end


