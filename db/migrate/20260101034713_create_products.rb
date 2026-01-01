class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :code
      t.string :name
      t.decimal :cost_price
      t.decimal :selling_price

      t.timestamps
    end
  end
end
