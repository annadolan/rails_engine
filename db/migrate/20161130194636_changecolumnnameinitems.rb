class Changecolumnnameinitems < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :unit_price, 'bigint USING CAST(unit_price AS bigint)'
  end
end
