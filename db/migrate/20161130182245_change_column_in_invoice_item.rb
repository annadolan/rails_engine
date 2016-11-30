class ChangeColumnInInvoiceItem < ActiveRecord::Migration[5.0]
  def change
    change_column :invoice_items, :unit_price, :string
  end
end
