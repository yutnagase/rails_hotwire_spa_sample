class Purchase < ApplicationRecord
  belongs_to :employee
  belongs_to :product
  
  validates :date, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end