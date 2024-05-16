class Category < ApplicationRecord
  has_many :items
  has_many :subcategories, class_name: 'Category', foreign_key: 'parent_id'
  belongs_to :parent_category, class_name: 'Category', optional: true

  validates :name, presence: true
  validates :name, uniqueness: { scope: :parent_id }
end
