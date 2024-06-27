class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :welcome ]

  def welcome
  end

  def home
    @subcategories = Category.where.not(parent_id: nil)
  end

  def dashboard
  end
end
