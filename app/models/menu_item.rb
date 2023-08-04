class MenuItem < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :subcategory_id, presence: true
  validates :restaurant_id, presence: true

  belongs_to :category
  belongs_to :sub_category, foreign_key: 'subcategory_id'
  belongs_to :restaurant
  belongs_to :user

  has_many :menu_orders, foreign_key: 'menuItem_id', dependent: :destroy
  has_many :orders, through: :menu_orders, dependent: :destroy
  has_many :restaurant_orders,foreign_key: 'menuItem_id', dependent: :destroy
  has_one_attached :foodimg
end
