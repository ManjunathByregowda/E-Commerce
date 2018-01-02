class AddColumnNetPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :net_price, :float
  end
end
