class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_number
      t.date :order_date
      t.integer :user_id
      t.float :total

      t.timestamps null: false
    end
  end
end
