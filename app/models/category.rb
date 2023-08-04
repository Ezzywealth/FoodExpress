class Category < ApplicationRecord
  validates :name, presence: true
  validates :user_id, presence: true

  has_many :menuItems, dependent: :destroy
  has_many :sub_categories, dependent: :destroy
end
