class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:homepage_food, :homepage_home, :welcome ]

  def welcome
  end

  def homepage_food
    @food_subcategories = Category.subcategories_with_parent_named('Food')
    @food_items = Item.joins(:category).where(categories: { parent_id: 1 })
  end

  def homepage_home
    @home_subcategories = Category.subcategories_with_parent_named('Home')
    @home_items = Item.joins(:category).where(categories: { parent_id: 11 })
  end

  def dashboard
  end
end
