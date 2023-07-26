class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :user_id, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
  validates :description, presence: true
  validates :image, presence: true

end
