class Building < ApplicationRecord
  # Associations
  has_many :users

  # Validations
  validates :name, presence: true
  validates :building_address, presence: true
end
