class CreateSales < ActiveRecord::Migration[8.1]
  def change
    create_table :sales do |t|
      t.date :date
      t.references :employee, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :amount

      t.timestamps
    end
  end
end
