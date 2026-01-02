require "application_system_test_case"

class DashboardTest < ApplicationSystemTestCase
  test "visiting the dashboard" do
    visit root_url
    assert_selector "h1", text: "ダッシュボード"
  end

  test "should display summary cards" do
    visit root_url

    # サマリーカードが表示される
    assert_selector "[data-turbo-frame-id='employees-summary']"
    assert_selector "[data-turbo-frame-id='products-summary']"
    assert_selector "[data-turbo-frame-id='customers-summary']"
    assert_selector "[data-turbo-frame-id='transactions-summary']"
  end

  test "should navigate to management pages" do
    visit root_url

    # 従業員管理リンク
    within "[data-turbo-frame-id='employees-summary']" do
      click_on "管理"
    end
    assert_selector "h1", text: "従業員管理"

    # ダッシュボードに戻る
    visit root_url

    # 商品管理リンク
    within "[data-turbo-frame-id='products-summary']" do
      click_on "管理"
    end
    assert_selector "h1", text: "商品管理"
  end

  test "should display sales and purchases summary" do
    visit root_url

    # 売上・仕入サマリーが表示される
    assert_selector "[data-turbo-frame-id='sales-summary']"
    assert_selector "[data-turbo-frame-id='purchases-summary']"

    # サマリー内のリンクが動作する
    within "[data-turbo-frame-id='sales-summary']" do
      click_on "売上管理"
    end
    assert_selector "h1", text: "売上管理"
  end

  test "turbo drive navigation should work" do
    visit root_url

    # ナビゲーションリンクでTurbo Drive遷移
    click_on "従業員"
    assert_selector "h1", text: "従業員管理"

    click_on "商品"
    assert_selector "h1", text: "商品管理"

    click_on "ダッシュボード"
    assert_selector "h1", text: "ダッシュボード"
  end
end
