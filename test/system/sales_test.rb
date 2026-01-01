require "application_system_test_case"

class SalesTest < ApplicationSystemTestCase
  setup do
    @sale = sales(:one)
    @employee = employees(:one)
    @product = products(:one)
    @customer = customers(:one)
  end

  test "visiting the index" do
    visit sales_url
    assert_selector "h1", text: "売上管理"
  end

  test "should create sale with turbo frame" do
    visit sales_url
    
    click_on "新規登録"
    
    within "#sale_form" do
      fill_in "日付", with: Date.current
      select @employee.name, from: "従業員"
      select @product.name, from: "商品"
      select @customer.name, from: "取引先"
      fill_in "数量", with: "5"
      fill_in "金額", with: "50000"
      
      click_on "登録"
    end
    
    assert_text @employee.name
    assert_text @product.name
    assert_text @customer.name
  end

  test "should update sale with turbo frame" do
    visit sales_url
    
    within "#sale_#{@sale.id}" do
      click_on "編集"
    end
    
    within "#sale_form" do
      fill_in "数量", with: "10"
      click_on "更新"
    end
    
    assert_text "10"
  end

  test "should destroy sale with turbo stream" do
    visit sales_url
    
    within "#sale_#{@sale.id}" do
      accept_confirm do
        click_on "削除"
      end
    end
    
    assert_no_selector "#sale_#{@sale.id}"
  end
end