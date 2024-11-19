class Category < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :subcategories, class_name: 'Category', foreign_key: 'parent_id', dependent: :destroy
  belongs_to :parent_category, class_name: 'Category', foreign_key: 'parent_id', optional: true
  has_one_attached :photo

  validates :name, presence: true
  validates :name, uniqueness: { scope: :parent_id }

  def self.subcategories_with_parent_named(parent_name)
    joins("INNER JOIN categories parent_categories ON categories.parent_id = parent_categories.id")
      .where.not(parent_id: nil)
      .where(parent_categories: { name: parent_name })
  end
end
