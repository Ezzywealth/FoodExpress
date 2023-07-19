class MenuItem < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :sub_category_id, presence: true
  validates :restaurant_id, presence: true

  belongs_to :category
  belongs_to :sub_category
  belongs_to :restaurant

  has_many :order

end
