class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :jwt_authenticatable, jwt_revocation_strategy: self

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_one_attached :userimg
end
