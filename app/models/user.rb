class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :first_name, :last_name, :phone, :birthday, :neighbourhood_type

  NEIGHBOURHOOD = ["Building", "Residential Street"]
  validates :neighbourhood_type, inclusion: { in: NEIGHBOURHOOD }

  has_many :items

end
