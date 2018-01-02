class AddColumnTaxIdToTaxes < ActiveRecord::Migration
  def change
    add_column :taxes, :tax_id, :integer
  end
end
