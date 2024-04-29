class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, :available_start_date, :available_end_date, :item_address, presence: true
  validates :quantity_value, numericality: { greater_than: 0 }
end
