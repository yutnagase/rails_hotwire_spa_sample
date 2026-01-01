require "application_system_test_case"

class EmployeesTest < ApplicationSystemTestCase
  setup do
    @employee = employees(:one)
  end

  test "visiting the index" do
    visit employees_url
    assert_selector "h1", text: "従業員管理"
  end

  test "should create employee with turbo frame" do
    visit employees_url
    
    click_on "新規登録"
    
    # Turbo Frameでフォームが表示される
    within "#employee_form" do
      fill_in "名前", with: "テスト太郎"
      fill_in "メールアドレス", with: "test@example.com"
      fill_in "住所", with: "東京都渋谷区"
      
      click_on "登録"
    end
    
    # Turbo Streamで一覧に追加される
    assert_text "テスト太郎"
    assert_text "test@example.com"
  end

  test "should update employee with turbo frame" do
    visit employees_url
    
    within "#employee_#{@employee.id}" do
      click_on "編集"
    end
    
    # Turbo Frameで編集フォームが表示される
    within "#employee_form" do
      fill_in "名前", with: "更新太郎"
      click_on "更新"
    end
    
    # Turbo Streamで一覧が更新される
    assert_text "更新太郎"
  end

  test "should destroy employee with turbo stream" do
    visit employees_url
    
    within "#employee_#{@employee.id}" do
      accept_confirm do
        click_on "削除"
      end
    end
    
    # Turbo Streamで要素が削除される
    assert_no_selector "#employee_#{@employee.id}"
  end

  test "should show employee details" do
    visit employees_url
    
    within "#employee_#{@employee.id}" do
      click_on "表示"
    end
    
    # 詳細ページに遷移
    assert_selector "h3", text: "従業員詳細"
    assert_text @employee.name
    assert_text @employee.email
  end
end