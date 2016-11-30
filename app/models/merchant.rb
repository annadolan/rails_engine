class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  def find_total_revenue(date = nil)
    invoices.joins(:transactions)
    .where(transactions: {result: "success"})
    .joins(:invoice_items)
    .sum("quantity * unit_price")
  end
end
