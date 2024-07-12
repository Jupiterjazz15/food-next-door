class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
    @category = params[:category]
    @type = params[:type]
    if @category.present?
      parent_category = Category.find_by(name: @category.capitalize)
      if parent_category
        @categories = Category.where(parent_id: parent_category.id)
      else
        @categories = []
      end
    else
      @categories = []
    end
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      redirect_to item_path(@item), notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :quantity_unit, :quantity_value, :available_start_date, :available_end_date, :best_before_date, :item_address, :food_condition, :home_condition, :category_id, :photo)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
