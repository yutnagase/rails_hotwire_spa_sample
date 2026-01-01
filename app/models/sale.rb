class Sale < ApplicationRecord
  belongs_to :employee
  belongs_to :product
  belongs_to :customer
end
