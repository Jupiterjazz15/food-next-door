class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, :available_start_date, :available_end_date, :item_address, presence: true
  validates :quantity_value, numericality: { greater_than: 0 }
  validates :quantity_unit, inclusion: { in: %w(Unit, Gram, mL, piece) }
  validates :food_condition, inclusion: { in: %w(Opened, Not opened, Cooked) }
  validates :home_condition, inclusion: { in: %w(Like new, Used - good, Used - excellent, Used - fair, Never open, Open - never used, Open - used) }

  has_one_attached :photo
end
