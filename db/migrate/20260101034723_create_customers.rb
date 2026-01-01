class CreateCustomers < ActiveRecord::Migration[8.1]
  def change
    create_table :customers do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
