class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]

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
      unless @item.user == current_user
        redirect_to  items_path
      end
  end 

  def update
        if @item.user != current_user
           redirect_to  items_path
        else
           if
              @item.update(item_params)
              redirect_to item_path
           else
            render :edit
           end
        end
  end

  private
 def set_item
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :status_id, :delivery_charge_id, 
                                 :prifecture_id, :shipping_day_id, :price, :image).merge(user_id:current_user.id)
  end




end


