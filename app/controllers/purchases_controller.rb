class PurchasesController < ApplicationController
  before_action :set_purchase, only: [ :show, :edit, :update, :destroy ]

  def index
    @purchases = Purchase.includes(:employee, :product).order(date: :desc)
  end

  def show
  end

  def new
    @purchase = Purchase.new
    @employees = Employee.all
    @products = Product.all
  end

  def create
    @purchase = Purchase.new(purchase_params)

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to @purchase, notice: "仕入が正常に作成されました。" }
        format.turbo_stream
      else
        @employees = Employee.all
        @products = Product.all
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @employees = Employee.all
    @products = Product.all
  end

  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to @purchase, notice: "仕入が正常に更新されました。" }
        format.turbo_stream
      else
        @employees = Employee.all
        @products = Product.all
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: "仕入が削除されました。" }
      format.turbo_stream
    end
  end

  private

  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  def purchase_params
    params.require(:purchase).permit(:date, :employee_id, :product_id, :quantity, :amount)
  end
end
