class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, :available_start_date, :available_end_date, :item_address, presence: true
  validates :quantity_value, numericality: { greater_than: 0 }
  validates :quantity_unit, inclusion: { in: %w(Unit kg g l cl ml) }, allow_nil: true
  validates :food_condition, inclusion: { in: %w(Opened Not\ opened Cooked) }, allow_nil: true
  validates :home_condition, inclusion: { in: %w(Like\ new Used\ -\ good Used\ -\ excellent Used\ -\ fair Never\ open Open\ never\ used Open\ -\ used) }, allow_nil: true
  validates :item_type, inclusion: { in: %w(donation request) }

  has_one_attached :photo
end
