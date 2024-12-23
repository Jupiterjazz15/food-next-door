class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:homepage, :welcome ]

  def welcome
  end

  def homepage
    category_name = params[:category]
    if category_name.blank? || Category.find_by(name: category_name).nil?
      redirect_to root_path, alert: "Sorry, we couldn't find the page you were looking for."
      return
    end

    load_items_for_category(category_name)

  end

  def dashboard
  end

  private

  # Méthode pour charger les données d'une catégorie
  def load_items_for_category(category_name)
    # Récupérer la catégorie principale (Food ou Home)
    @category = Category.find_by(name: category_name)

    # Récupérer les sous-catégories et items
    @subcategories = Category.subcategories_with_parent_named(category_name)
    @donations = fetch_items(@category, 'donation')
    @requests = fetch_items(@category, 'request')

    # Appliquer les filtres et la recherche
    apply_filter_by_subcategory if params[:subcategory].present?
    apply_search if params[:query].present?
  end

  # Récupérer les items selon le type (donation ou request)
  def fetch_items(category, item_type)
    Item.joins(:category)
        .where(categories: { parent_id: category.id }, item_type: item_type)
        .order(created_at: :desc)
  end

  # Appliquer le filtre par sous-catégorie si un params est passé
  def apply_filter_by_subcategory
    subcategory = Category.find_by(name: params[:subcategory])
    @donations = @donations.where(category: subcategory)
    @requests = @requests.where(category: subcategory)
  end

  # Appliquer la recherche sur les items si un query est passé en params
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
