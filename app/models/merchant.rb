class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  def find_total_revenue
    invoices.joins(:invoice_items).sum("quantity * unit_price")
  end
end
