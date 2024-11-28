class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:homepage_food, :homepage_home, :welcome ]

  def welcome
  end

  def homepage_food
    food_category = Category.find_by(name: 'Food')
    return if food_category.nil?

    @food_subcategories = Category.subcategories_with_parent_named('Food')

    # Récupérer tous les items de type "donation" de la catégorie Food
    @food_items_donations = Item.joins(:category)
                                .where(categories: { parent_id: food_category.id }, item_type: 'donation')
                                .order(created_at: :desc)

    # Récupérer tous les items de type "request" de la catégorie Food
    @food_items_requests = Item.joins(:category)
                               .where(categories: { parent_id: food_category.id }, item_type: 'request')
                               .order(created_at: :desc)

    # Appliquer le filtre par catégorie si présent (quand on clique sur une carte catégorie)
    if params[:category].present?
      @food_items_donations = @food_items_donations.joins(:category)
                                                  .where(categories: { name: params[:category] })

      @food_items_requests = @food_items_requests.joins(:category)
                                                .where(categories: { name: params[:category] })
    end


    # Gestion de la recherche si query est présent
    if params[:query].present?
      cleaned_query = params[:query].strip
      sql_subquery = <<~SQL
        items.title ILIKE :query
        OR categories.name ILIKE :query
      SQL
      @food_items_donations = @food_items_donations.where(sql_subquery, query: "%#{cleaned_query}%")
      @food_items_requests = @food_items_requests.where(sql_subquery, query: "%#{cleaned_query}%")
      end
  end

  def homepage_home
    @home_subcategories = Category.subcategories_with_parent_named('Home')
    @home_items_donations = Item.joins(:category)
                                .where(categories: { parent_id: Category.find_by(name: 'Home').id }, item_type: 'donation')
                                .order(created_at: :desc)

    @home_items_requests = Item.joins(:category)
                               .where(categories: { parent_id: Category.find_by(name: 'Home').id }, item_type: 'request')
                               .order(created_at: :desc)
  end

  def dashboard
  end
end
