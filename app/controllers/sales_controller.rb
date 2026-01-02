class SalesController < ApplicationController
  before_action :set_sale, only: [ :show, :edit, :update, :destroy ]

  def index
    @sales = Sale.includes(:employee, :product, :customer).order(date: :desc)
  end

  def show
  end

  def new
    @sale = Sale.new
    @employees = Employee.all
    @products = Product.all
    @customers = Customer.all
  end

  def create
    @sale = Sale.new(sale_params)

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: "売上が正常に作成されました。" }
        format.turbo_stream
      else
        @employees = Employee.all
        @products = Product.all
        @customers = Customer.all
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @employees = Employee.all
    @products = Product.all
    @customers = Customer.all
  end

  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: "売上が正常に更新されました。" }
        format.turbo_stream
      else
        @employees = Employee.all
        @products = Product.all
        @customers = Customer.all
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: "売上が削除されました。" }
      format.turbo_stream
    end
  end

  private

  def set_sale
    @sale = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(:date, :employee_id, :product_id, :customer_id, :quantity, :amount)
  end
end
