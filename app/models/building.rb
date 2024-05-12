class Building < ApplicationRecord
  has_many :users

  validates :name, presence: true
  validates :building_address, presence: true
end
