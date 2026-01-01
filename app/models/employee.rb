class Employee < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :address, presence: true
  
  has_many :sales, dependent: :destroy
  has_many :purchases, dependent: :destroy
end