class ChangeColumnInItem < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :unit_price, :string
  end
end
