# 従業員データ
employees = [
  { name: "北海道 太郎", email: "hokkaido.taro@example.com", address: "北海道札幌市中央区北1条西1丁目1-1" },
  { name: "神奈川 次郎", email: "kanagawa.jiro@example.com", address: "神奈川県横浜市西区みなとみらい1-1-1" },
  { name: "大阪 三郎", email: "osaka.saburo@example.com", address: "大阪府大阪市北区梅田1-1-1" },
  { name: "福岡 四郎", email: "fukuoka.shiro@example.com", address: "福岡県福岡市博多区博多駅前1-1-1" },
  { name: "愛知 五郎", email: "aichi.goro@example.com", address: "愛知県名古屋市中村区名駅1-1-1" }
]

employees.each do |employee_data|
  Employee.find_or_create_by(email: employee_data[:email]) do |employee|
    employee.name = employee_data[:name]
    employee.address = employee_data[:address]
  end
end

# 商品データ
products = [
  { code: "P001", name: "ノートパソコン", cost_price: 80000, selling_price: 120000 },
  { code: "P002", name: "デスクトップPC", cost_price: 60000, selling_price: 90000 },
  { code: "P003", name: "タブレット", cost_price: 30000, selling_price: 45000 },
  { code: "P004", name: "スマートフォン", cost_price: 50000, selling_price: 75000 },
  { code: "P005", name: "ワイヤレスマウス", cost_price: 2000, selling_price: 3500 }
]

products.each do |product_data|
  Product.find_or_create_by(code: product_data[:code]) do |product|
    product.name = product_data[:name]
    product.cost_price = product_data[:cost_price]
    product.selling_price = product_data[:selling_price]
  end
end

# 取引先データ
customers = [
  { code: "C001", name: "株式会社テクノロジー" },
  { code: "C002", name: "有限会社イノベーション" },
  { code: "C003", name: "合同会社デジタル" },
  { code: "C004", name: "株式会社ソリューション" },
  { code: "C005", name: "企業法人システムズ" }
]

customers.each do |customer_data|
  Customer.find_or_create_by(code: customer_data[:code]) do |customer|
    customer.name = customer_data[:name]
  end
end

# サンプル売上データ
if Sale.count == 0
  5.times do |i|
    Sale.create!(
      date: Date.current - i.days,
      employee: Employee.all.sample,
      product: Product.all.sample,
      customer: Customer.all.sample,
      quantity: rand(1..10),
      amount: rand(10000..100000)
    )
  end
end

# サンプル仕入データ
if Purchase.count == 0
  5.times do |i|
    Purchase.create!(
      date: Date.current - i.days,
      employee: Employee.all.sample,
      product: Product.all.sample,
      quantity: rand(1..20),
      amount: rand(5000..80000)
    )
  end
end

puts "初期データの投入が完了しました！"
puts "従業員: #{Employee.count}件"
puts "商品: #{Product.count}件"
puts "取引先: #{Customer.count}件"
puts "売上: #{Sale.count}件"
puts "仕入: #{Purchase.count}件"
