class Customer < ApplicationRecord
  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
  
  has_many :sales, dependent: :destroy
end