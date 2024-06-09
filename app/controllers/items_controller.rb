class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
    @type = params[:type]
    @category = params[:category]
    @categories = Category.where(parent_id: Category.find_by(name: @category.capitalize).id)
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    # Séparer les dates de début et de fin récupérées du champ de date range
    if params[:item][:available_date_range].present?
      date_range = params[:item][:available_date_range].split(" to ")
      @item.available_start_date = date_range[0]
      @item.available_end_date = date_range[1]
    end

    if @item.save
      redirect_to item_path(@item), notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :quantity_unit, :quantity_value, :available_date_range, :best_before_date, :item_address, :food_condition, :home_condition, :category_id, :photo)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
