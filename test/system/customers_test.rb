require "application_system_test_case"

class CustomersTest < ApplicationSystemTestCase
  setup do
    @customer = customers(:one)
  end

  test "visiting the index" do
    visit customers_url
    assert_selector "h1", text: "取引先管理"
  end

  test "should create customer with turbo frame" do
    visit customers_url
    
    click_on "新規登録"
    
    within "#customer_form" do
      fill_in "取引先コード", with: "C999"
      fill_in "取引先名", with: "テスト株式会社"
      
      click_on "登録"
    end
    
    assert_text "C999"
    assert_text "テスト株式会社"
  end

  test "should update customer with turbo frame" do
    visit customers_url
    
    within "#customer_#{@customer.id}" do
      click_on "編集"
    end
    
    within "#customer_form" do
      fill_in "取引先名", with: "更新株式会社"
      click_on "更新"
    end
    
    assert_text "更新株式会社"
  end

  test "should destroy customer with turbo stream" do
    visit customers_url
    
    within "#customer_#{@customer.id}" do
      accept_confirm do
        click_on "削除"
      end
    end
    
    assert_no_selector "#customer_#{@customer.id}"
  end
end