class DashboardController < ApplicationController
  def index
    @employees_count = Employee.count
    @products_count = Product.count
    @customers_count = Customer.count
    @sales_count = Sale.count
    @purchases_count = Purchase.count
    @total_sales_amount = Sale.sum(:amount)
    @total_purchases_amount = Purchase.sum(:amount)
  end
end