class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :details
      t.string :landmark
      t.string :city
      t.string :state
      t.integer :pincode

      t.timestamps null: false
    end
  end
end
