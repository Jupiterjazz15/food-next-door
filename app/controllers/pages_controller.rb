class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:homepage_food, :homepage_home, :welcome ]

  def welcome
  end

  def homepage_food
    load_items_for_category('Food')
  end

  def homepage_home
    load_items_for_category('Home')
  end

  def dashboard
  end

  private

  # Méthode pour charger les données d'une catégorie
  def load_items_for_category(category_name)
    # Récupérer la catégorie principale (Food ou Home)
    category = Category.find_by(name: category_name)
    return if category.nil?

    # Récupérer les sous-catégories de la catégorie principale
    instance_variable_set("@#{category_name.downcase}_subcategories", Category.subcategories_with_parent_named(category_name))

    # Récupérer les items de type donation et request
    @donations = fetch_items(category, 'donation')
    @requests = fetch_items(category, 'request')

    # Appliquer les filtres et la recherche
    apply_filters
    apply_search if params[:query].present?

    # Assigner les variables d'instance pour les items
    instance_variable_set("@#{category_name.downcase}_items_donations", @donations)
    instance_variable_set("@#{category_name.downcase}_items_requests", @requests)
  end

  # Récupérer les items selon le type (donation ou request)
  def fetch_items(category, item_type)
    Item.joins(:category)
        .where(categories: { parent_id: category.id }, item_type: item_type)
        .order(created_at: :desc)
  end

  # Appliquer les filtres par catégorie si un filtre est passé en paramètre
  def apply_filters
    return unless params[:category].present?

    category_filter = params[:category]
    @donations = @donations.joins(:category).where(categories: { name: category_filter })
    @requests = @requests.joins(:category).where(categories: { name: category_filter })
  end

  # Appliquer la recherche sur les items si un query est passé en paramètre
  def apply_search
    cleaned_query = params[:query].strip
    sql_subquery = <<~SQL
      items.title ILIKE :query
      OR categories.name ILIKE :query
    SQL
    @donations = @donations.where(sql_subquery, query: "%#{cleaned_query}%")
    @requests = @requests.where(sql_subquery, query: "%#{cleaned_query}%")
  end
end
