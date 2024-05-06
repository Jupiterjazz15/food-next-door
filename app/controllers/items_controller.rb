class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
    @main_categories = Category.where(parent_category_id: nil)  # Catégories sans parent
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :quantity_unit, :quantity_value, :available_start_date, :available_end_date, :best_before_date, :item_address, :food_condition, :home_condition, :is_available, :category_id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
