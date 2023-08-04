class SubCategory < ApplicationRecord
  validates :name, presence: true
  validates :category_id, presence: true
  validates :user_id, presence: true

  belongs_to :category
  has_many :menuItems, dependent: :destroy
end
