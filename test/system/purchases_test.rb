require "application_system_test_case"

class PurchasesTest < ApplicationSystemTestCase
  setup do
    @purchase = purchases(:one)
    @employee = employees(:one)
    @product = products(:one)
  end

  test "visiting the index" do
    visit purchases_url
    assert_selector "h1", text: "仕入管理"
  end

  test "should create purchase with turbo frame" do
    visit purchases_url
    
    click_on "新規登録"
    
    within "#purchase_form" do
      fill_in "日付", with: Date.current
      select @employee.name, from: "従業員"
      select @product.name, from: "商品"
      fill_in "数量", with: "20"
      fill_in "金額", with: "30000"
      
      click_on "登録"
    end
    
    assert_text @employee.name
    assert_text @product.name
  end

  test "should update purchase with turbo frame" do
    visit purchases_url
    
    within "#purchase_#{@purchase.id}" do
      click_on "編集"
    end
    
    within "#purchase_form" do
      fill_in "数量", with: "25"
      click_on "更新"
    end
    
    assert_text "25"
  end

  test "should destroy purchase with turbo stream" do
    visit purchases_url
    
    within "#purchase_#{@purchase.id}" do
      accept_confirm do
        click_on "削除"
      end
    end
    
    assert_no_selector "#purchase_#{@purchase.id}"
  end
end