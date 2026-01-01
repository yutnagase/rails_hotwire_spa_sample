require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "商品管理"
  end

  test "should create product with turbo frame and stimulus" do
    visit products_url
    
    click_on "新規登録"
    
    # Turbo Frameでフォームが表示される
    within "#product_form" do
      fill_in "商品コード", with: "P999"
      fill_in "商品名", with: "テスト商品"
      fill_in "原価", with: "1000"
      fill_in "売価", with: "1500"
      
      # Stimulusで利益率が計算される
      assert_text "利益率: 33.3%"
      
      click_on "登録"
    end
    
    # Turbo Streamで一覧に追加される
    assert_text "P999"
    assert_text "テスト商品"
  end

  test "should update product with turbo frame" do
    visit products_url
    
    within "#product_#{@product.id}" do
      click_on "編集"
    end
    
    # Turbo Frameで編集フォームが表示される
    within "#product_form" do
      fill_in "商品名", with: "更新商品"
      click_on "更新"
    end
    
    # Turbo Streamで一覧が更新される
    assert_text "更新商品"
  end

  test "should destroy product with turbo stream" do
    visit products_url
    
    within "#product_#{@product.id}" do
      accept_confirm do
        click_on "削除"
      end
    end
    
    # Turbo Streamで要素が削除される
    assert_no_selector "#product_#{@product.id}"
  end

  test "stimulus price calculator should work" do
    visit new_product_url
    
    fill_in "原価", with: "800"
    fill_in "売価", with: "1200"
    
    # Stimulusで利益率が自動計算される
    assert_text "利益率: 33.3%"
  end
end