class BudgetList < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true
  validates :category, presence: true
  validates :allow_overspending, inclusion: { in: [true, false] }
  validates :frequency, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  belongs_to :user
end
